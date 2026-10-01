class QuizController < ApplicationController
  def index
  end

  def create
    @wrist_circumference = params[:wrist_circumference]
    @size_preference = params[:size_preference]

    render plain: "Wrist: #{@wrist_circumference} cm | Size: #{@size_preference}"
  end
end
