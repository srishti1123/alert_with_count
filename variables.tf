variable "alert_conditions" {
    type = list(object({
    name                = string
    query               = string
    threshold           = number
    threshold_duration  = number
    aggregation_window  = number
    aggregation_delay   = number
  }))
}

variable "alert_policy_name" {
  type = string
}
variable "incident_preference" {
  type= string
}
