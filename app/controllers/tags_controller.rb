class TagsController < ApplicationController
  def index
    @tags = redis.smembers 'tags'
  end

  def create
    redis.sadd 'tags', params[:tag][:name]
    redirect_to tags_path
  end

  def destroy
    redis.srem 'tags', params[:id]
    redirect_to tags_path
  end

  private
  def redis
    @redis ||= Redis.new
  end
end
