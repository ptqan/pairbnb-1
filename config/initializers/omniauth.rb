Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '1110333322383887', '3d3a0ec6f43697c3a5207fb2c6832a21',
      info_fields: 'name,email'
    end