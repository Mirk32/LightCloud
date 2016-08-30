OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook, '293398771018314', '72e5086aeb5bd5008229df03a4cd1c09',
  scope: 'public_profile'
end