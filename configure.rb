def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'DhLE7y8C9Vg7hsqJobhggH4KF'
    config.consumer_secret     = 'KONEbcVATipjB1tSmuUefE5r04F8u8qxbch8CYFykHVy9L6Wk7'
    config.access_token        = '858240613-BBc1JIMJAsiByIaUWfzsYPKnxBxKYMPhaCnTd2PX'
    config.access_token_secret = 'ZlZWpeWH9G3ArKG2XfsxR2lXmDaBBWIKv8nsHHgSNJcaT'
  end
end
