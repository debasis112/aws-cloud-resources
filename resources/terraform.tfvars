

nsg_ipv4_cidr = "0.0.0.0/0"

# subnet_zone = "ap-south-1a"

network_security_group_tags = {
  Name        = "deb-nsg-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}

aws_secret_manager_tags = {
  Name        = "deb-secret-manager-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}

web_cluster_tags = {
  Name        = "deb-ecs-cluster-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}

ssl_cert_tags = {
  Name        = "deb-ssl-cert-01",
  Project     = "debasis-project",
  Environment = "Production",
  Department  = "cloud-computing",
  Owner       = "Debasis_Panda",
  Company     = "WIPRO",
  STD_ID      = "2020WA86256",
}