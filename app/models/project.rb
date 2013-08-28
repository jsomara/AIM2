class Project < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true
	validates :user_id, presence: true
end

  def collect_project_titles
    titles = []
    projects.each { |project| titles << project.title }
    return titles
  end

  def show_titles
  	titles = @user.collect_project_titles
  	titles.each { @project.title }
  end