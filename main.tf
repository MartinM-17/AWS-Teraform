# Proveedor de AWS: Aquí definimos el proveedor y la región en la que desplegaremos los recursos.
provider "aws" {
region = var.aws_region
}

# Crear una VPC
resource "aws_vpc" "VPC_12" {
cidr_block = "10.0.0.0/16"  # Cambia el CIDR según tus necesidades
}

# Crear una subred
resource "aws_subnet" "subnet_12" {
vpc_id            = aws_vpc.VPC_12.id
availability_zone = var.vpc_availability_zone      # Zona de disponibilidad
cidr_block        = "10.0.1.0/24"  # CIDR para la subred
}


# Grupo de seguridad
# Permite tráfico HTTP, HTTPS y SSH hacia la instancia EC2.
resource "aws_security_group" "SG_Desafio12" {
description = "Allow HTTP, HTTPS, and SSH traffic"
vpc_id = aws_vpc.VPC_12.id # Asegúrate de que el SG está asociado a la misma VPC que la subred



ingress {                                   # Regla de entrada para HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {                                   # Regla de entrada para HTTPS
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {                                   # Regla de entrada para SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {                                    # Regla de salida para permitir tráfico saliente
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

# Recurso de Instancia EC2
resource "aws_instance" "My_Web12" {
ami           = var.ami_id
instance_type = var.instance_type

subnet_id             = aws_subnet.subnet_12.id  # Asocia la subred
vpc_security_group_ids = [aws_security_group.SG_Desafio12.id] # Asocia el Security Group creado a la instancia

tags = {                                    # Etiquetas que describen el recurso
    Owner          = "Martin"
    Email          = "Martin@educacionit.com"
    Team           = "DevOpsTeam"
    Proyectogrupo1 = "Actividad-AWS"
}

# Script de inicio: instala Apache y lo activa
user_data = <<-EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
EOF
}

# Bucket S3
# Crea un bucket S3 único y sube un archivo PDF como prueba.
resource "aws_s3_bucket" "bucket_Desafio12" {
bucket = var.s3_bucket_name # Cambia a un nombre único

tags = {
    Name  = "bucket-Desafio12"
    Owner = "Martin"
    Team  = "DevOpsTeam"
}
}

resource "aws_s3_object" "pdf_upload" {
bucket = aws_s3_bucket.bucket_Desafio12.bucket                    # Vincula el bucket S3 creado
key    = "desafio12.pdf"                                          # Nombre del archivo en S3
source = "E:/Martin/BootCamp DevOps/Desafio 12/Desafio 12.pdf"    # Ruta local al archivo PDF de prueba
}

# Volumen EBS
# Crea un volumen EBS de 2GB y lo adjunta a la instancia EC2.
resource "aws_ebs_volume" "Volumen_12" {
availability_zone = var.ebs_availability_zone       # Zona de disponibilidad
size              = var.ebs_volume_size             # Tamaño en GB
}

resource "aws_volume_attachment" "ebs_att" {
device_name = "/dev/xvdf"                   # Nombre del dispositivo donde se montará el volumen
volume_id   = aws_ebs_volume.Volumen_12.id       # ID del volumen EBS creado
instance_id = aws_instance.My_Web12.id          # ID de la instancia EC2
force_detach = true                         # Forzar el desmontaje si está montado en otra instancia
}
