resource "aws_alb_target_group" "user*-alb-tg" {
    name = "user*-alb-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.user*-vpc.id
    health_check {
        interval = 30
        path = "/"
        healthy_threshold = 3
        unhealthy_threshold = 3
    }
    tags = { Name = "user*-Frontend Target Group" }
}
