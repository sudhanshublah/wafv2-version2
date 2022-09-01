# data "aws_wafv2_web_acl" "name" {
#   name = "test-wacl"
#   scope = "REGIONAL"
# }

resource "aws_wafv2_web_acl" "test-wacl"{
    # ID = "e8588b2e-9bdb-430b-9187-484df66110bb"
    name = "test-wacl"
    scope = "REGIONAL"
	#capacity    = 100
	default_action {
		allow {}
	}
	rule {
		name     = "uat-whitelist-ip-rule"
		priority = 0
		action {
			block {}
		}
		statement {
			and_statement {
				statement {
					not_statement {
						statement {
							ip_set_reference_statement {
								arn = aws_wafv2_ip_set.site24_7_ipset.arn
								ip_set_forwarded_ip_config {
									fallback_behavior = "MATCH"
									header_name       = "true-client-ip"
									position          = "FIRST"
								}
							}
						}
					}
				}
				statement {
					or_statement {
						statement {
							byte_match_statement {
								positional_constraint = "CONTAINS_WORD"
								search_string         = "swagger"
								field_to_match {
									uri_path {}
								}
								text_transformation {
									priority = 1
									type     = "NONE"
								}
							}
						}
						statement {
							byte_match_statement {
								positional_constraint = "CONTAINS_WORD"
								search_string         = "webjars"
								field_to_match {
									uri_path {}
								}
								text_transformation {
									priority = 2
									type     = "NONE"
								}
							}
						}
						statement {
							byte_match_statement {
								positional_constraint = "CONTAINS_WORD"
								search_string         = "api-docs"
								field_to_match {
									uri_path {}
								}
								text_transformation {
									priority = 3
									type     = "NONE"
								}
							}
						}
						statement {
							byte_match_statement {
								positional_constraint = "CONTAINS_WORD"
								search_string         = "actuators"
								field_to_match {
									uri_path {}
								}
								text_transformation {
									priority = 4
									type     = "NONE"
								}
							}
						}
						# statement {
						# 	byte_match_statement {
						# 		positional_constraint = "CONTAINS"
						# 		search_string         = "/dth/user/login"
						# 		field_to_match {
						# 			uri_path {}
						# 		}
						# 		text_transformation {
						# 			priority = 5
						# 			type     = "NONE"
						# 		}
						# 	}
						# }
						# statement {
						# 	byte_match_statement {
						# 		positional_constraint = "CONTAINS"
						# 		search_string         = "/secure/system/user/login"
						# 		field_to_match {
						# 			uri_path {}
						# 		}
						# 		text_transformation {
						# 			priority = 6
						# 			type     = "NONE"
						# 		}
						# 	}
						# }
						# statement {
						# 	byte_match_statement {
						# 		positional_constraint = "STARTS_WITH"
						# 		search_string         = "/dth/user/"
						# 		field_to_match {
						# 			uri_path {}
						# 		}
						# 		text_transformation {
						# 			priority = 7
						# 			type     = "URL_DECODE"
						# 		}
						# 	}
						# }
					}
				}
			}
		}
		visibility_config {
			cloudwatch_metrics_enabled = false
			metric_name                = "uat-kong-ip-whitelist"
			sampled_requests_enabled   = false
		}
	}
	visibility_config {
			cloudwatch_metrics_enabled = false
			metric_name                = "uat-waf-group-kong-ip-whitelist"
			sampled_requests_enabled   = false
	}
}


# resource "aws_wafv2_web_acl_logging_configuration" "logging_configuration" {
# 	log_destination_configs = [lookup(var.logging_s3_bucket_arn, terraform.workspace, "undefined")]
# 	resource_arn            = aws_wafv2_web_acl.wafv2_web_acl.arn
# }

# resource "aws_wafv2_web_acl" "test-wacl" {
#   # (resource arguments)
#   ID = "e8588b2e-9bdb-430b-9187-484df66110bb"
#   name = "test-wacl"
#   scope = "REGIONAL"
# }
