Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '225406654251087', 'bbcc74e22d72ef137b8d504f5061edf0', 
	:iframe=>true #this tells facebook to redirect outside of the iframe
end

