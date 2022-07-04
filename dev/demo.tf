### ZONES

resource "aws_route53_zone" "_sam-in" {
  force_destroy = "false"
  name          = "sam.in"
}

### RECORDS

#resource "aws_route53_record" "_sam-in-_AAAA_" {
#  name    = "sam.in"
#  records = ["", "", "", ""]
#  ttl     = "300"
#  type    = "AAAA"
#  zone_id = aws_route53_zone._sam-in.zone_id
#}

#resource "aws_route53_record" "_sam-in-_A_" {
#  name    = "sam.in"
#  records = ["", "", "", ""]
#  ttl     = "300"
#  type    = "A"
#  zone_id = aws_route53_zone._sam-in.zone_id
#}

resource "aws_route53_record" "_sam-in-_TXT_" {
  name = "sam.in"
  ###
  # The first verification code was issued by ,
  # while the second one was issued by sam via the Cloud Run domain mapping process.
  ###
  records = [""]
  ttl     = "300"
  type    = "TXT"
  zone_id = aws_route53_zone._sam-in.zone_id
}

#resource "aws_route53_record" "www-_sam-in-_CNAME_" {
#  name    = "www.sam.in"
#  records = ["googlehosted.com."]
#  ttl     = "300"
#  type    = "CNAME"
#  zone_id = aws_route53_zone._sam-in.zone_id
#}
