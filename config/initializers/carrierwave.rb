CarrierWave.configure do |config|

  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["O9nvaWGcvD86W7keehXRPhFNOWUXRi_gTQI8PscX"]
  config.qiniu_secret_key    = ENV["yegEe9Lf-lXuzBCN2owf_S6E7CUItude0dbWwCXC"]
  config.qiniu_bucket        = ENV["myfirstapp"]
  config.qiniu_bucket_domain = ENV["p0qn0nxq3.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniu.com"  #选择不同的区域时，"up.qiniu.com" 不同

end
