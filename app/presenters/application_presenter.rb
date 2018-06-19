class ApplicationPresenter
  def initialize(application)
    @application = application
    @application.position = application.position.titleize
    @application = @application.as_json.merge(
      {
        skills: @application.required_skills.as_json,
        match_percent: @application.skills_match,
        resume: @application.resume.as_json
      }
    )
  end

  def present
    @application.as_json
  end
end