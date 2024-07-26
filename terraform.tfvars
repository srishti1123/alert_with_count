alert_policy_name   = "alert-terraform-policy"
incident_preference = "PER_CONDITION"
alert_conditions = [
  {
    name                = "first_input_delay_alert"
    query               = "SELECT average(firstInputDelay) AS 'FID (ms)' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    threshold           = 200
    threshold_duration  = 300
    aggregation_window  = 60
    aggregation_delay   = 120
  },
  {
    name                = "cumulative_layout_shift_alert"
    query               = "SELECT average(cumulativeLayoutShift) AS 'CLS' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    threshold           = 1000
    threshold_duration  = 300
    aggregation_window  = 60
    aggregation_delay   = 120
  },
  {
    name                = "largest_contentful_paint_alert"
    query               = "SELECT average(largestContentfulPaint) AS 'LCP (ms)' FROM PageViewTiming WHERE appName = 'relicstaurants/browser2'"
    threshold           = 4.5
    threshold_duration  = 300
    aggregation_window  = 60
    aggregation_delay   = 120
  },
  {
    name                = "cpu-alert"
    query               = "SELECT average(cpuPercent) as '%CPU Used' FROM SystemSample"
    threshold           = 80
    threshold_duration  = 300
    aggregation_window  = 60
    aggregation_delay   = 120
  },
  {
    name                = "memory-alert"
    query               = "SELECT average(memoryUsedBytes)*100/average(memoryTotalBytes) as '%RAM Used' FROM SystemSample"
    threshold           = 90
    threshold_duration  = 300
    aggregation_window  = 60
    aggregation_delay   = 120
  }
]
