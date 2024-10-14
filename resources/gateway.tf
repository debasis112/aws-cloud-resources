# # Internet Gateway for VPC
# resource "aws_internet_gateway" "gateway-01" {
#   count  = var.vpc_count
#   vpc_id = aws_vpc.vpc-01[count.index].id
#   tags   = merge(var.tags, { Name = "${var.base_name}-gw-01" })
# }
