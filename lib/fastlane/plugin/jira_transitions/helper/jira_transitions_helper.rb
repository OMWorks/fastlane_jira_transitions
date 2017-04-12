module Fastlane
  module Helper
    class JiraTransitionsHelper
      # class methods that you define here become available in your action
      # as `Helper::JiraTransitionsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the jira_transitions plugin helper!")
      end
    end
  end
end
