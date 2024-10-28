# Región de AWS donde se crearán los recursos
variable "aws_region" {
description = "Región de AWS donde se crearán los recursos"
default     = "us-east-1"
}

# Tipo de instancia EC2
variable "instance_type" {
description = "Tipo de instancia EC2 compatible con el free tier"
default     = "t2.micro"
}

# ID de la AMI para la instancia EC2
variable "ami_id" {
description = "ID de la AMI Amazon Linux 2 (HVM)"
default     = "ami-0ddc798b3f1a5117e"        # AMI de Linux en us-east-1, si es necesario cambiar por una  compatible con tu región
}

# Zona de disponibilidad para el Security Group
variable "security_group_availability_zone" {
description = "Zona de disponibilidad para el Security Group"
default     = "us-east-1a"                   # Cambiar si es necesario
}


# Zona de disponibilidad para la VPC
variable "vpc_availability_zone" {
description = "Zona de disponibilidad para la VPC"
default     = "us-east-1a"                   # Cambiar si es necesario
}


# Tamaño del volumen EBS
variable "ebs_volume_size" {
description = "Tamaño del volumen EBS en GB"
default     = 2
}

# Zona de disponibilidad para el volumen EBS
variable "ebs_availability_zone" {
description = "Zona de disponibilidad donde se creará el volumen EBS"
default     = "us-east-1a"                   # Cambiar si es necesario
}

# Nombre único del bucket S3
variable "s3_bucket_name" {
description = "Nombre único del bucket S3"
default     = "bucket-desafio12"    # Cambia este nombre por uno único
}
