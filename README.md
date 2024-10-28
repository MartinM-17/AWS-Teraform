# Proyecto de Creación de Infraestructura en AWS con Terraform

Este proyecto automatiza la creación de recursos en AWS utilizando Terraform, lo que permite desplegar infraestructura con configuraciones y dependencias predefinidas. Los recursos implementados son una instancia EC2, un bucket S3 y un volumen EBS, todos configurados de acuerdo con las buenas prácticas de etiquetado y automatización.

## Objetivos
1. **Automatización de infraestructura en la nube**: Aprender a implementar infraestructura en AWS mediante Terraform.
2. **Despliegue de recursos básicos**: Crear una instancia EC2, un bucket S3 y un volumen EBS configurados para interactuar entre sí.
3. **Práctica de IaC (Infrastructure as Code)**: Facilitar la gestión, reutilización y eliminación de recursos en AWS.

## Estructura del Proyecto

- **main.tf**: Archivo principal de configuración, que contiene la definición de los recursos.
- **variables.tf**: Archivo de variables donde se especifican las configuraciones editables (como región de AWS, tipo de instancia, etc.).
- **outputs.tf**: Archivo opcional para mostrar los valores de salida de los recursos creados, como la IP pública de la instancia EC2 o el nombre del bucket S3.
  
## Requisitos Previos

- **Cuenta de AWS**: Es necesario contar con una cuenta de AWS activa y configurada.
- **Terraform instalado**: Tener instalado Terraform en tu máquina local o en una VM.
- **Credenciales de AWS configuradas**: Las credenciales deben estar configuradas en el archivo `~/.aws/credentials` o en las variables de entorno.

## Configuración y Ejecución

1. **Inicialización**: Ejecutar el comando `terraform init` en el directorio raíz del proyecto para inicializar los módulos y proveedores de Terraform.
2. **Aplicación**: Usar `terraform apply` para crear los recursos en AWS, revisando y confirmando los cambios cuando sea solicitado.
3. **Validación**: Verificar que la infraestructura se haya desplegado correctamente, comprobando los recursos en la consola de AWS o utilizando `terraform output`.
4. **Destrucción**: Utilizar `terraform destroy` para eliminar todos los recursos creados y evitar costos en AWS.

## Validación de los Recursos

Una vez aplicado el código con `terraform apply`, se pueden validar los recursos de la siguiente manera:

- **Instancia EC2**: Verificar su estado y conectividad en la consola de AWS.
- **Bucket S3**: Comprobar la existencia del archivo cargado.
- **Volumen EBS**: Asegurarse de que está adjunto a la instancia EC2 y correctamente montado.

## Limpieza de Recursos

Para eliminar todos los recursos creados, ejecutar el comando:

terraform destroy
