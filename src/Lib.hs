module Lib
    ( someFunc
    ) where

import Network.Wai
import Network.Wai.Handler.Warp

import Servant

type FileAPI = Raw

dir = "."

fileAPI :: Proxy FileAPI
fileAPI = Proxy

fileServer :: Server FileAPI
fileServer = serveDirectoryFileServer dir

someFunc :: IO ()
someFunc =
  run 2333 (serve fileAPI fileServer)
