resource "aws_route53_record" "this" {
  count   = length(var.instance)
  zone_id = var.zone_id
  name    = "${var.instance[count.index]}.${var.domain_name}" # inerpolation
  type    = "A"
  ttl     = 1

  records = [aws_instance.this[count.index].private_ip]
}  

resource "aws_route53_record" "frontend" {
  count   = 3
  zone_id = var.zone_id
  name    = "${var.domain_name}" # inerpolation
  type    = "A"
  ttl     = 1

  records = [aws_instance.this[2].private_ip]
  allow_overwrite = true
}