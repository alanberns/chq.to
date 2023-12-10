class ErrorsController < ApplicationController
    skip_before_action :protect_pages
    def not_found
        render status: :not_found, layout: false
    end
    def internal_server_error
        render status: :internal_server_error, layout: false
    end
    def forbidden
        render status: :forbidden, layout: false
    end
end
