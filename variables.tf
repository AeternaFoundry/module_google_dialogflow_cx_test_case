variable "dialogflow_cx_test_cases" {
  description = <<EOT
Map of dialogflow_cx_test_cases, attributes below
Required:
    - display_name
Optional:
    - deletion_policy
    - notes
    - parent
    - tags
    - test_case_conversation_turns (block):
        - user_input (optional, block):
            - enable_sentiment_analysis (optional)
            - injected_parameters (optional)
            - input (optional, block):
                - dtmf (optional, block):
                    - digits (optional)
                    - finish_digit (optional)
                - event (optional, block):
                    - event (required)
                - language_code (optional)
                - text (optional, block):
                    - text (required)
            - is_webhook_enabled (optional)
        - virtual_agent_output (optional, block):
            - current_page (optional, block):
                - name (optional)
            - session_parameters (optional)
            - text_responses (optional, block):
                - text (optional)
            - triggered_intent (optional, block):
                - name (optional)
    - test_config (block):
        - flow (optional)
        - page (optional)
        - tracking_parameters (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    display_name    = string
    deletion_policy = optional(string)
    notes           = optional(string)
    parent          = optional(string)
    tags            = optional(list(string))
    test_case_conversation_turns = optional(list(object({
      user_input = optional(object({
        enable_sentiment_analysis = optional(bool)
        injected_parameters       = optional(string)
        input = optional(object({
          dtmf = optional(object({
            digits       = optional(string)
            finish_digit = optional(string)
          }))
          event = optional(object({
            event = string
          }))
          language_code = optional(string)
          text = optional(object({
            text = string
          }))
        }))
        is_webhook_enabled = optional(bool)
      }))
      virtual_agent_output = optional(object({
        current_page = optional(object({
          name = optional(string)
        }))
        session_parameters = optional(string)
        text_responses = optional(list(object({
          text = optional(list(string))
        })))
        triggered_intent = optional(object({
          name = optional(string)
        }))
      }))
    })))
    test_config = optional(object({
      flow                = optional(string)
      page                = optional(string)
      tracking_parameters = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        length(v.display_name) >= 0 && length(v.display_name) <= 200
      )
    ])
    error_message = "must be between 0 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        v.notes == null || (length(v.notes) >= 0 && length(v.notes) <= 400)
      )
    ])
    error_message = "must be between 0 and 400 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        v.test_case_conversation_turns == null || alltrue([for item in v.test_case_conversation_turns : (item.user_input == null || (item.user_input.injected_parameters == null || (can(jsondecode(item.user_input.injected_parameters)))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        v.test_case_conversation_turns == null || alltrue([for item in v.test_case_conversation_turns : (item.user_input == null || (item.user_input.input == null || (item.user_input.input.text == null || (length(item.user_input.input.text.text) >= 0 && length(item.user_input.input.text.text) <= 256))))])
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        v.test_case_conversation_turns == null || alltrue([for item in v.test_case_conversation_turns : (item.virtual_agent_output == null || (item.virtual_agent_output.session_parameters == null || (can(jsondecode(item.virtual_agent_output.session_parameters)))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        alltrue([for item in v.last_test_result : (item.conversation_turns == null || alltrue([for item in item.conversation_turns : (item.user_input == null || alltrue([for item in item.user_input : (item.injected_parameters == null || (can(jsondecode(item.injected_parameters))))]))]))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        alltrue([for item in v.last_test_result : (item.conversation_turns == null || alltrue([for item in item.conversation_turns : (item.user_input == null || alltrue([for item in item.user_input : (item.input == null || alltrue([for item in item.input : (item.text == null || alltrue([for item in item.text : (item.text == null || (length(item.text) >= 0 && length(item.text) <= 256))]))]))]))]))])
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        alltrue([for item in v.last_test_result : (item.conversation_turns == null || alltrue([for item in item.conversation_turns : (item.virtual_agent_output == null || alltrue([for item in item.virtual_agent_output : (item.session_parameters == null || (can(jsondecode(item.session_parameters))))]))]))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_test_cases : (
        alltrue([for item in v.last_test_result : (item.conversation_turns == null || alltrue([for item in item.conversation_turns : (item.virtual_agent_output == null || alltrue([for item in item.virtual_agent_output : (item.status == null || alltrue([for item in item.status : (item.details == null || (can(jsondecode(item.details))))]))]))]))])
      )
    ])
    error_message = "must be valid JSON"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

