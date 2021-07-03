output "alb_fqdn" {
    value = module.aws_ec2_scale.module_output.dns_name
}