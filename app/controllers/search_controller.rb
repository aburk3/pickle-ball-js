class SearchController < ApplicationController

  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      parameter = params[:search].downcase.strip
      @clubs = Club.all.where("lower(name) LIKE :search",
       search: "%#{parameter}%"
      )
      @users = User.all.where(
        "lower(first_name) LIKE :search OR lower(last_name) LIKE :search",
        search: "%#{parameter}%"
      )

      if @users.count == 0
        split_string = parameter.scan(/\w+/).values_at(0, -1)
        first_name = split_string[0]
        last_name = split_string[1]
        @users = User.where(
          "lower(first_name) LIKE :first_name AND lower(last_name) LIKE :last_name",
          first_name: "%#{first_name}%", last_name: "%#{last_name}%"
          )
      end
      @tournaments = Tournament.all.where("lower(name) LIKE :search", search: "%#{parameter}%")
    end
  end

end
