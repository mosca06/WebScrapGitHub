module ProfileResponse
  def mock_from_file(profile_name)
    file = File.open(Rails.root.glob("spec/support/**/github_#{profile_name}.html").first)
    allow_any_instance_of(Webscrap::GitHub).to receive(:open_link).and_return(file)
  end
end
