module "alb" {

  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.0"

  name = "${terraform_alb.name} = ALB"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnet[1]]
  security_groups = [module.loadbalancer_SG.security_group_id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name_prefix = "app1-"

      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy             = 3
        unhealthy_threshold = 3
        timout              = 6
        protocol            = "HTTP"
        matcher             = "200-300"
      }

      protocol_version = "HTTP1"
      targets = {
        app_vml = {
          target_id = [for n in module.Private_EC2 : n.id][0]
          port      = 80
        },

        app1_vm2 = {
          target_id = [for n in module.Private_EC2 : n.id][1]
          port      = 80
        }
      }
      tags = {
        environment = production
      }
    }
  ]
}




