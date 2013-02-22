module OmniauthMacros
	def mock_auth_hash
		OmniAuth.config.mock_auth[:facebook] = {'provider' =>"facebook",
                                            'uid' =>"12345",
                                            'info'=>{'name'=>"John Doe"},
                                            'credentials'=>{'token'=>"AAABBBCCC"}}
    end
end