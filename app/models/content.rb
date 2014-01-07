class Content < ActiveRecord::Base
  attr_accessible :attachable_id, :html, :markup

  before_validation :parse_and_cache_content
  after_initialize :blank_markup

  cattr_accessor :run_parser_in_test_env
  Content.run_parser_in_test_env = false

  def unchanged?
    !new_record? && !markup_changed?
  end

  def blank_markup
    self.markup ||= ''
  end

  def parse_and_cache_content(force = false)
    return if Rails.env.test? && !Content.run_parser_in_test_env
    return if unchanged? && !force

    self.html = markup

    # self.html = TransformMarkup.call(markup).outputs[:output]
    # todo should maybe just call routine straight up? instead of update_attributes
    # !!! shouldn't be able to update content if container published, something that
    # belongs in a routine (cross class checks, etc)
  end



end