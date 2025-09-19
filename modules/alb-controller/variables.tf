variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "oidc_provider_arn" {
  description = "The ARN of the OIDC provider."
  type        = string
}

variable "oidc_provider_url" {
  description = "The URL of the OIDC provider."
  type        = string
}

variable "eks_cluster_certificate_authority" {
  description = "The certificate authority data for the EKS cluster."
  type        = string
}

variable "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  type        = string
}