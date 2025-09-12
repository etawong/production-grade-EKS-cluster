variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "The name of the project, used for naming resources."
  type        = string
}

variable "key_pair_name" {
  description = "The name of the AWS key pair to use for SSH access."
  type        = string
}

variable "zone1" {
  description = "The first availability zone."
  type        = string
}

variable "zone2" {
  description = "The second availability zone."
  type        = string
}

variable "eks_name" {
  description = "The name of the EKS cluster."
  type        = string
}