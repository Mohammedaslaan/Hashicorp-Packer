output "instance_publicip" {
  description = "ec2 instance public ip using list"
   value = [for instance in aws_instance.myec2vm : instance.public_ip]
}
output "instance_publicDns" {
  description = "ec2 instance public DNS using map"
   value = {for instance in aws_instance.myec2vm: instance.public_ip => instance.public_dns}
}

output "instance_publicDns_usingAdvancedMap" {
  description = "ec2 instance public DNS using Advanced map"
   value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}
# output "instance_ARN_usinglegacySplatOperator" {
#   description = "ec2 instance public DNS using legacySplatOperator"
#    value = [aws_instance.myec2vm.*.arn]
# }
# output "instance_ARN_usinglatestSplatOperator" {
#   description = "ec2 instance public DNS using latestSplatOperator"
#    value = [aws_instance.myec2vm[*].arn]
# }