module Paths_git_prompt (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/tiuweehan/.zsh/zsh-git-prompt/.stack-work/install/x86_64-osx/3446a6e2a3a8903440b4d16827704c033d7ef10c26dd351d0659bf25f8ee073a/7.10.3/bin"
libdir     = "/Users/tiuweehan/.zsh/zsh-git-prompt/.stack-work/install/x86_64-osx/3446a6e2a3a8903440b4d16827704c033d7ef10c26dd351d0659bf25f8ee073a/7.10.3/lib/x86_64-osx-ghc-7.10.3/git-prompt-0.1.0.0-GyKbGQsRujX2Ik9bjYPmgX"
datadir    = "/Users/tiuweehan/.zsh/zsh-git-prompt/.stack-work/install/x86_64-osx/3446a6e2a3a8903440b4d16827704c033d7ef10c26dd351d0659bf25f8ee073a/7.10.3/share/x86_64-osx-ghc-7.10.3/git-prompt-0.1.0.0"
libexecdir = "/Users/tiuweehan/.zsh/zsh-git-prompt/.stack-work/install/x86_64-osx/3446a6e2a3a8903440b4d16827704c033d7ef10c26dd351d0659bf25f8ee073a/7.10.3/libexec"
sysconfdir = "/Users/tiuweehan/.zsh/zsh-git-prompt/.stack-work/install/x86_64-osx/3446a6e2a3a8903440b4d16827704c033d7ef10c26dd351d0659bf25f8ee073a/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "git_prompt_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "git_prompt_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "git_prompt_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "git_prompt_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "git_prompt_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
