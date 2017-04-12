describe Fastlane::Actions::JiraTransitionsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The jira_transitions plugin is working!")

      Fastlane::Actions::JiraTransitionsAction.run(nil)
    end
  end
end
