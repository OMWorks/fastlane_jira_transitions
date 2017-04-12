module Fastlane
  module Actions

  require 'jira-ruby'

    class JiraTransitionsAction < Action
      def self.run(params)
        Actions.verify_gem!('jira-ruby')

        client = params[:client]
        issue = client.Issue.find(params[:ticket_id])
        issue_transitions = issue.transitions.all
        transition_builder = issue.transitions.build

        if params[:transition_id] 
          transition_builder.save!('transition' => {'id' => params[:transition_id]})
        else 
          transition = issue_transitions.select { |transition|
            if params[:matching]
              params[:matching].call(transition)
            else 
              transition.name == params[:transition_name]
            end
          }.first
          if !transition.nil? && !transition.id.nil?
           transition_builder.save('transition' => {'id' => transition.id })
          elsif params[:fail_if_no_matching] == true 
            UI.crash!("0 matching transitions")
          end
        end
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
          FastlaneCore::ConfigItem.new(key: :client,
                                is_string: false,
                                optional: false,
                                type: JIRA::Client),
          FastlaneCore::ConfigItem.new(key: :ticket_id,
                               description: "ID of ticket",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :transition_id,
                               description: "ID of transition to perform",
                                  optional: true,
                                      type: String,
                              verify_block: proc do |value|
                                              UI.user_error!("Invalid transition_id") if value.to_s.length == 0
                                          end),
          FastlaneCore::ConfigItem.new(key: :transition_name,
                               description: "Name of transition to perform",
                                  optional: true,
                                      type: String,
                              verify_block: proc do |value|
                                              UI.user_error!("Invalid transition_name") if value.to_s.length == 0
                                          end),
          FastlaneCore::ConfigItem.new(key: :matching,
                               description: "Block for custom transition matching options.
                               Transition that is passed to block is 'transition' from jira-ruby gem",
                                  optional: true,
                                 is_string: false),
          FastlaneCore::ConfigItem.new(key: :fail_if_no_matching,
                               description: "Whether plugin should crash if there is no matching transition",
                                  optional: true,
                                 is_string: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
