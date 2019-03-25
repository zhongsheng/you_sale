# coding: utf-8
class UtilityController < ApplicationController
  before_action :authenticate_user!

  def upload_token
    bucket = 'miaomei'
    key = params['key']
    # 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
      bucket, # 存储空间
      key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
      60,    # token 过期时间，默认为 3600 秒，即 1 小时
      mimeLimit: 'image/*'
    )
    # 生成上传 Token
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)
    render :json => {:value => uptoken}
  end
end
