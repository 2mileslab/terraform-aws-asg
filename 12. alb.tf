resource "aws_alb" "user*-alb" {
    name = "user*-alb"
    internal = false
    security_groups = [aws_security_group.user*-alb-sg.id]
    subnets = [
        aws_subnet.user*-subnet1.id,
        aws_subnet.user*-subnet2.id
    ]
    access_logs {
        bucket = aws_s3_bucket.user*-s3.id
        prefix = "user*-alb"
        enabled = true
    }
    tags = {
        Name = "user*-alb"
    }
    lifecycle { create_before_destroy = true }
}

resource "aws_alb_listener" "http" {
    load_balancer_arn = aws_alb.user*-alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        target_group_arn = aws_alb_target_group.user*-alb-tg.arn
        type = "forward"
    }
}
