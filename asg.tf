resource "aws_launch_template" "asg" {
  name_prefix   = "asg1"
  image_id      = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "sga" {
  availability_zones = ["us-east-2a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.asg.id
    version = "$Latest"
  }
}
