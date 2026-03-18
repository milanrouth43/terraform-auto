package main

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.instance_type != "t2.micro"
  msg := sprintf("Instance type must be t2.micro, but found %v", [resource.change.after.instance_type])
}