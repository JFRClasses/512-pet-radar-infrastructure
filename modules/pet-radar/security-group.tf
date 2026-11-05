resource "aws_security_group" "pet_radar_sg" {
  name = "${var.environment}-pet-radar-sg"
  description = "Asegura los puertos del servidor del ambiente"

  //Conexion por SSH 22
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "PetRadarApi"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    description = "WireguardVPN"
    from_port = 51820
    to_port = 51820
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}