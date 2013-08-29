class Project < ActiveRecord::Base
  #attr_accessor :title, :audience, :behavior, :step, :sme
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true
  validates :user_id, presence: true

  def collect_project_titles
    projects.map { |p| p.title }
  end

  def show_titles
    titles = @user.collect_project_titles
    titles.each { @project.title }
  end
end
