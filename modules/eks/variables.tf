variable "eks_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "eks_version" {
  description = "The version of the EKS cluster."
  type        = string
}

variable "private_subnet1_id" {
  description = "The ID of the first private subnet."
  type        = string
}

variable "private_subnet2_id" {
  description = "The ID of the second private subnet."
  type        = string
}