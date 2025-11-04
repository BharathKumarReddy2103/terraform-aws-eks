# IAM role for bastion (if you already have one, skip this)
resource "aws_iam_role" "bastion_role" {
  name = "TerraformAdmin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Instance profile that wraps the role
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "TerraformAdminProfile"
  role = aws_iam_role.bastion_role.name
}

# Attach SSM policy so you can use Session Manager to connect
resource "aws_iam_role_policy_attachment" "bastion_ssm" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id

  # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("bastion.sh")
  iam_instance_profile = aws_iam_instance_profile.bastion_profile.name
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }
  )
}