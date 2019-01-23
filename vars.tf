variable "aws_region" {
    type = "string"
}
variable "aws_vpc_id" {
    type = "string"
}
variable "aws_ec2_count" {
    type = "string"
}
variable "aws_ec2_name" {
    type = "string"
}
variable "aws_ami_id" {
    type = "string"
}
variable "aws_instance_type" {
    type = "string"
}
variable "aws_ec2_public_ip" {
    type = "string"
}
variable "aws_ssh_key_name" {
    type = "string"
}
variable "aws_sg_ids" {
    type = "list"
}
variable "aws_root_size" {
    type = "string"
}
variable "aws_def_tags" {
    type = "map"
}
variable "aws_user_data" {
    type = "string"
    default = " "
}
variable "aws_ec2_iam_profile" {
    type = "string"
    default = " "
}
