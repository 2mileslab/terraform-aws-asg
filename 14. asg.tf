resource "aws_autoscaling_group" "user*-asg" {
  name = "${aws_launch_configuration.user*-asg-launch.name}-asg"

  min_size             = 2
  desired_capacity     = 2
  max_size             = 3

  health_check_type    = "ELB"
  #load_balancers= ["${aws_alb.alb.id}" ] #classic
  target_group_arns   = [aws_alb_target_group.user*-alb-tg.arn]
  #alb = "${aws_alb.alb.id}"
  
  launch_configuration = aws_launch_configuration.user*-asg-launch.name
  
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity="1Minute"

  vpc_zone_identifier  = [
    aws_subnet.user*-subnet1.id,
    aws_subnet.user*-subnet2.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "user*-web-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "user*-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.user*-asg.id
  alb_target_group_arn   = aws_alb_target_group.user*alb-tg.arn
}


