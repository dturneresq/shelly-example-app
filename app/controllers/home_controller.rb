class HomeController < ApplicationController
  def index
  end

  def test_pg_timeout
    s = Time.now
    ActiveRecord::Base.connection.execute("select pg_sleep(20)")
    f = Time.now

    render text: "OK #{s} - #{f}"
  end

  def test_timeout
    s = Time.now
    sleep 20
    f = Time.now

    render text: "OK #{s} - #{f}"
  end
end
