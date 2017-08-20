ECHO OFF
ECHO Make sure the path does not have any spaces in it!
REM This scripts downloads the mnist data and unzips it.
SET currentDirectory=%~dp0
PUSHD %CD%
CD ..
CD ..
SET ROOT=%CD%
POPD
SET WGET="%ROOT%\tools\3rdparty\bin\wget.exe"
SET GZIP="%ROOT%\tools\3rdparty\bin\gzip.exe"

ECHO "Downloading MNIST..."

FOR %%G IN (train-images-idx3-ubyte train-labels-idx1-ubyte t10k-images-idx3-ubyte t10k-labels-idx1-ubyte) DO (
%WGET% --no-check-certificate http://yann.lecun.com/exdb/mnist/%%G.gz
%GZIP% -d %%G.gz )
ECHO "Done."
pause