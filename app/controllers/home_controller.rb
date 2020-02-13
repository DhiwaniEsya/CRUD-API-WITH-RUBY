class HomeController < ApplicationController

def index
    @user = User.all
    render json:{
        values: @user,
        message: "Success!",
}, status: 200
end
def show
    @user = User.find_by_id(params[:id])
    if @user.present?
        render json:{
            values: @user,
            message: "Success!",
    }, status: 200
    else
        render json:{
            values: "",
            message: "Data Not Found",
    }, status: 400      
    end
end
def user_params
    params.permit(:name, :phone)
end
def notFound
    render json: {
        values: {},
        message: "Data Nout Found",
    }, status: 400
end
def create
    @user = User.new(user_params)

    if @user.save
        render json: {
            values: "",
            message: "Success!",
        }, status: 200
        else
            render json: {
                values: "",
                message: "Failed!",  
            }, status: 400
        end 
end
def update
    @user = User.find(params[:id])

    if @user.update(user_params)
        render json: {
            values: {},
            message: "Success!",
        }, status: 200
        else
            render json: {
                values: {},
                message: "Failed!",  
            }, status: 400
        end
end
def destroy
    @user = User.find(params[:id])

    if @user.destroy
        render json: {
            values: {},
            message: "Success!",
        }, status: 200
        else
            render json: {
                values: {},
                message: "Failed!",  
            }, status: 400
        end
end
end