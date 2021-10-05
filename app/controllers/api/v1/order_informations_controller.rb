module Api
  module V1
    class OrderInformationsController < ApplicationController
      before_action :set_orderinformation, only: [:show, :update, :destroy]

      def index
        @order_informations = OrderInformation.all.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded orderinformations', data: @order_informations }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the orderinformation', data: @order_information }
      end

      def create
        @order_information = OrderInformation.new(order_information_params)

        if @order_information.save
          render json: { status: 'SUCCESS', data: @order_information }
        else
          render json: { status: 'ERROR', data: @order_information }
        end
      end

      def destroy
        @order_information.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the order_information', data: @order_information }
      end

      def update
        if @order_information.update(order_information_params)
          render json: { status: 'SUCCESS', message: 'Updated the orderinformation', data: @order_information }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @order_information.errors }
        end
      end


      private

      def set_orderinformation
        @order_information = OrderInformation.find(params[:id])
      end

      def order_information_params
        params.require(:order_information).permit(:name, :maker, :catalog_id, :supplier, :delivered, :delivered_at)
      end
    end
  end
end
