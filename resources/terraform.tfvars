vpc_cidr = "10.0.0.0/16"

subnet_cidr = "10.0.1.0/24"

vpc_tags = {
  Name        = "deb-vpc-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}

subnet_tags = {
  Name        = "deb-subnet-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}

network_security_group_tags = {
  Name        = "deb-nsg-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}