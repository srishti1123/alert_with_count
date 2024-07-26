resource "newrelic_alert_policy" "alert-terraform" {
  name                = var.alert_policy_name
  incident_preference = var.incident_preference
}


resource "newrelic_nrql_alert_condition" "conditions" {
  count               = length(var.alert_conditions)

  policy_id                    = newrelic_alert_policy.alert-terraform.id
  type                         = "static"
  name                         = var.alert_conditions[count.index].name
  enabled                      = true
  violation_time_limit_seconds = 259200

  nrql {
    query = var.alert_conditions[count.index].query
  }

  critical {
    operator              = "above"
    threshold             = var.alert_conditions[count.index].threshold
    threshold_duration    = var.alert_conditions[count.index].threshold_duration
    threshold_occurrences = "all"
  }

  fill_option         = "none"
  aggregation_window  = var.alert_conditions[count.index].aggregation_window
  aggregation_method  = "event_flow"
  aggregation_delay   = var.alert_conditions[count.index].aggregation_delay
}