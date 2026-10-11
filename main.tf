resource "google_dialogflow_cx_test_case" "dialogflow_cx_test_cases" {
  for_each = var.dialogflow_cx_test_cases

  display_name    = each.value.display_name
  deletion_policy = each.value.deletion_policy
  notes           = each.value.notes
  parent          = each.value.parent
  tags            = each.value.tags

  dynamic "test_case_conversation_turns" {
    for_each = each.value.test_case_conversation_turns != null ? each.value.test_case_conversation_turns : []
    content {
      dynamic "user_input" {
        for_each = test_case_conversation_turns.value.user_input != null ? [test_case_conversation_turns.value.user_input] : []
        content {
          enable_sentiment_analysis = user_input.value.enable_sentiment_analysis
          injected_parameters       = user_input.value.injected_parameters
          dynamic "input" {
            for_each = user_input.value.input != null ? [user_input.value.input] : []
            content {
              dynamic "dtmf" {
                for_each = input.value.dtmf != null ? [input.value.dtmf] : []
                content {
                  digits       = dtmf.value.digits
                  finish_digit = dtmf.value.finish_digit
                }
              }
              dynamic "event" {
                for_each = input.value.event != null ? [input.value.event] : []
                content {
                  event = event.value.event
                }
              }
              language_code = input.value.language_code
              dynamic "text" {
                for_each = input.value.text != null ? [input.value.text] : []
                content {
                  text = text.value.text
                }
              }
            }
          }
          is_webhook_enabled = user_input.value.is_webhook_enabled
        }
      }
      dynamic "virtual_agent_output" {
        for_each = test_case_conversation_turns.value.virtual_agent_output != null ? [test_case_conversation_turns.value.virtual_agent_output] : []
        content {
          dynamic "current_page" {
            for_each = virtual_agent_output.value.current_page != null ? [virtual_agent_output.value.current_page] : []
            content {
              name = current_page.value.name
            }
          }
          session_parameters = virtual_agent_output.value.session_parameters
          dynamic "text_responses" {
            for_each = virtual_agent_output.value.text_responses != null ? virtual_agent_output.value.text_responses : []
            content {
              text = text_responses.value.text
            }
          }
          dynamic "triggered_intent" {
            for_each = virtual_agent_output.value.triggered_intent != null ? [virtual_agent_output.value.triggered_intent] : []
            content {
              name = triggered_intent.value.name
            }
          }
        }
      }
    }
  }

  dynamic "test_config" {
    for_each = each.value.test_config != null ? [each.value.test_config] : []
    content {
      flow                = test_config.value.flow
      page                = test_config.value.page
      tracking_parameters = test_config.value.tracking_parameters
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

