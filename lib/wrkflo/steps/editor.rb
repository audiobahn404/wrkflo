class Editor < Step
  add_alias :editor

  property :which,  required: false,  default: Profile.options['editor']
  property :path,   required: true

  def init
    @editor = config.which || Profile.options['editor']
    @step = Step.create(@editor.to_sym, @raw_config, project)
    @name = "editor[#{@step.name}]"
  end

  def run;    @step.run;    end
  def unrun;  @step.unrun;  end
end
