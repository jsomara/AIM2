require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @user = basic_user
  end

  def basic_user
    user_params = { name:     'Joel',
                    email:    'jdmikk@gmail.com',
                    password: '1234abcd',
                    password_confirmation: '1234abcd'
                  }

    return User.create(user_params)
  end

  def test_title
    p = Project.create(title: 'My Project', audience: 'idiots', behavior: 'Bad', sme: 'jdmikk')
    @user.projects << p
    @user.save
    assert @user.collect_project_titles.include?('My Project')
  end

end
