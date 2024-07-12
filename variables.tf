variable "network_acl_no" {
  description = "(Required) The ID of the Network ACL."
  type        = string
}

variable "inbound" {
  description = <<EOF
  Specifies an Inbound(ingress) rules. Parameters defined below. This argument is processed in attriutbe-as-blocks mode.
  - priority - (Required) Priority for rules, Used for ordering. Can be an integer from 1 to 199.
  - protocol - (Required) Select between TCP, UDP, and ICMP. Accepted values: TCP | UDP | ICMP
  - rule_action - (Required) The action to take. Accepted values: ALLOW | DROP
  - ip_block - (Optional, Required if deny_allow_group_no is not provided) The CIDR block to match. This must be a valid network mask.
  - deny_allow_group_no - (Optional, Required if ip_block is not provided) The access source Deny-Allow Group number of network ACL rules. You can specify a Deny-Allow Group instead of an IP address block as the access source. deny_allow_group_no can be obtained through the Data source ncloud_network_acl_deny_allow_group
  - port_range - (Optional) Range of ports to apply. You can enter from 1 to 65535. e.g. set single port: 22 or set range port : 8000-9000
  NOTE: If the value of protocol is ICMP, the port_range values will be ignored and the rule will apply to all ports.
  - description - (Optional) description to create.
EOF
  type = list(object({
    priority            = number
    protocol            = string
    rule_action         = string
    ip_block            = optional(string)
    deny_allow_group_no = optional(string)
    port_range          = optional(string)
    description         = optional(string)
  }))
  default = []
}

variable "outbound" {
  description = <<EOF
  Specifies an Outbound(egress) rules. Parameters defined below. This argument is processed in attriutbe-as-blocks mode.
  - priority - (Required) Priority for rules, Used for ordering. Can be an integer from 1 to 199.
  - protocol - (Required) Select between TCP, UDP, and ICMP. Accepted values: TCP | UDP | ICMP
  - rule_action - (Required) The action to take. Accepted values: ALLOW | DROP
  - ip_block - (Optional, Required if deny_allow_group_no is not provided) The CIDR block to match. This must be a valid network mask.
  - deny_allow_group_no - (Optional, Required if ip_block is not provided) The access source Deny-Allow Group number of network ACL rules. You can specify a Deny-Allow Group instead of an IP address block as the access source. deny_allow_group_no can be obtained through the Data source ncloud_network_acl_deny_allow_group
  - port_range - (Optional) Range of ports to apply. You can enter from 1 to 65535. e.g. set single port: 22 or set range port : 8000-9000
  NOTE: If the value of protocol is ICMP, the port_range values will be ignored and the rule will apply to all ports.
  - description - (Optional) description to create.
EOF
  type = list(object({
    priority            = number
    protocol            = string
    rule_action         = string
    ip_block            = optional(string)
    deny_allow_group_no = optional(string)
    port_range          = optional(string)
    description         = optional(string)
  }))
  default = []
}