{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Text (Text)
import Data.Aeson (ToJSON(..), object, (.=))

-- 1. Define a data type for JSON responses
data Message = Message
  { message :: Text
  , status  :: Int
  }

-- 2. Define how to convert that data type to JSON
instance ToJSON Message where
  toJSON (Message m s) = object [ "message" .= m, "status" .= s ]

main :: IO ()
main = scotty 3000 $ do
  -- Route: GET /
  -- Serves the static HTML file from your project folder
  get "/" $ do
    file "static/index.html"

  -- Route: GET /json
  -- Returns a JSON object: {"message": "Success", "status": 200}
  get "/json" $ do
    json $ Message "Success" 200

  -- Route: GET /hello/:name
  -- Example of reading a URL parameter
  get "/hello/:name" $ do
    name <- param "name"
    text $ "Hello, " <> name <> "!"