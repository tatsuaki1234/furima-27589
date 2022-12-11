class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
      # binding.pryは処理に不要なので削除する
  # 値をDBへ保存する実装
  end


private

def メソッド名
  params.permit(指定のカラムを記述する)
end
end
