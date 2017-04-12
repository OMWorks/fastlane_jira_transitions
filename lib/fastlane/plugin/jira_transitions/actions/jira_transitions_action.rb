module Fastlane
  module Actions
    class JiraTransitionsAction < Action
      def self.run(params)
        UI.message("The jira_transitions plugin is working!")
      end

      def self.description
        "Runs transitions for specified JIRA tickets"
      end

      def self.authors
        ["Ostap Taran"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Helps to run transitions for specified JIRA tickets (matching by transition name or id)"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "JIRA_TRANSITIONS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
