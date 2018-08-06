module Admin
  class KeywordsController < Admin::ApplicationController
    def index
      super
      @resources = Keyword.
        page(params[:page]).
        per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Keyword.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
