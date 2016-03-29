OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:vishen] = OmniAuth::AuthHash.new(
  { 
    uid: '12345', 
    provider: "mindvalley",
    info: { 
      first_name: "Vishen",
      last_name: "Lakhiani",
      email: "vishen@mindvalley.com"
    }
    credentials: {
      token: "asdvasvaebr",
      id_token: "asfvaef2f8927yf872f"
    }
  }
)

OmniAuth.config.mock_auth[:najib] = OmniAuth::AuthHash.new(
  { 
    uid: '15432', 
    provider: "mindvalley",
    info: { 
      first_name: "Najib",
      last_name: "Razak",
      email: "najib@ambank.com.my"
    }
    credentials: {
      token: "v9238rfn9823n",
      id_token: "784bgtnevwuhnw3rfer"
    }
  }
)