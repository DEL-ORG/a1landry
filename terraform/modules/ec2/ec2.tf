resource "aws_instance" "ec2" {
    ami = data.aws_ami.jenkins-master-ami.id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    subnet_id = data.aws_subnet.subnet_public.id


    root_block_device {
      volume_size = var.root_volume
      volume_type = "gp3"
    }

    tags = merge(var.tags, {
    Name = format("%s-%s-${var.resource_type}", var.tags["environment"], var.tags["project"])
     })
    }

  
