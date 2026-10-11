output "dialogflow_cx_test_cases_id" {
  description = "Map of id values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no id are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dialogflow_cx_test_cases_creation_time" {
  description = "Map of creation_time values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no creation_time are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.creation_time if v.creation_time != null && length(v.creation_time) > 0 }
}
output "dialogflow_cx_test_cases_deletion_policy" {
  description = "Map of deletion_policy values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dialogflow_cx_test_cases_display_name" {
  description = "Map of display_name values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no display_name are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "dialogflow_cx_test_cases_last_test_result" {
  description = "Map of last_test_result values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no last_test_result are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.last_test_result if v.last_test_result != null && length(v.last_test_result) > 0 }
}
output "dialogflow_cx_test_cases_name" {
  description = "Map of name values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no name are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dialogflow_cx_test_cases_notes" {
  description = "Map of notes values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no notes are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.notes if v.notes != null && length(v.notes) > 0 }
}
output "dialogflow_cx_test_cases_parent" {
  description = "Map of parent values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no parent are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "dialogflow_cx_test_cases_tags" {
  description = "Map of tags values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no tags are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "dialogflow_cx_test_cases_test_case_conversation_turns" {
  description = "Map of test_case_conversation_turns values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no test_case_conversation_turns are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => v.test_case_conversation_turns if v.test_case_conversation_turns != null && length(v.test_case_conversation_turns) > 0 }
}
output "dialogflow_cx_test_cases_test_config" {
  description = "Map of test_config values across all dialogflow_cx_test_cases, keyed the same as var.dialogflow_cx_test_cases except keys with no test_config are omitted"
  value       = { for k, v in google_dialogflow_cx_test_case.dialogflow_cx_test_cases : k => one(v.test_config) if v.test_config != null && length(v.test_config) > 0 }
}

