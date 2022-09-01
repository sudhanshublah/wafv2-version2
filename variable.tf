# variable "sampled_requests_enabled" {
# 	type    = bool
# 	default = true
# }

# variable "ipset_block_name" {
# 	default = "whitelist-ip-set"
# }

# variable "ipset_whitelist_name" {
# 	default = "ip-set"
# }

# variable "cloudwatch_metrics_enabled" {
# 	type    = bool
# 	default = true
# }

# variable "wafv2_acl_metric_name" {
# 	type    = map(string)
# 	default = {
# 		non-prod = "savetvbillNonProdWebACL"
# 		prod     = "savetvbillProdWebACL"
# 	}
# }

# variable "logging_s3_bucket_arn" {
# 	type    = map(string)
# 	default = {
# 		non-prod = "arn:aws:s3:::aws-waf-logs-dth-non-prod"
# 		prod     = "arn:aws:s3:::aws-waf-logs-dth-prod"
# 	}
# }

variable "ipset_whitelist_name" {
	default = "ip-set"
}

# variable "sampled_requests_enabled" {
# 	type    = bool
# 	default = true
# }

# variable "cloudwatch_metrics_enabled" {
# 	type    = bool
# 	default = true
# }

# variable "logging_s3_bucket_arn" {
# 	type    = map(string)
# 	default = {
# 		uat = "arn:aws:s3:::aws-waf-logs-uat"
# 	}
# }

