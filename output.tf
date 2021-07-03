output "alb_fqdn" {
    value = module.aws_ec2_scale.alb_fqdn.dns_name
}