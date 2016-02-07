class TestPagesController < ApplicationController

  before_action :login_required, only: :test_auth

  def test_all
  end

  def test_auth
  end

end
