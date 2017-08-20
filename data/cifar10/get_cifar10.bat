ECHO OFF
REM This scripts downloads the CIFAR10 (binary version) data and unzips it.
SET currentDirectory=%~dp0
PUSHD %CD%
CD ..
CD ..
SET ROOT=%CD%
POPD
SET WGET="%ROOT%\tools\3rdparty\bin\wget.exe"
SET TAR="%ROOT%\tools\3rdparty\bin\7za.exe"
SET RM="%ROOT%\tools\3rdparty\bin\rm.exe"
SET MV="%ROOT%\tools\3rdparty\bin\mv.exe"

 if not exist "%currentDirectory%cifar-10-binary.tar.gz" (
ECHO "Downloading CIFAR10..."
%WGET% --no-check-certificate http://www.cs.toronto.edu/~kriz/cifar-10-binary.tar.gz
) else (
ECHO File exits, skipping download...
)
ECHO "Unzipping..."
%TAR% e cifar-10-binary.tar.gz && %RM% -f cifar-10-binary.tar.gz
%TAR% e cifar-10-binary.tar && %RM% -f cifar-10-binary.tar && %RM% -r cifar-10-binary
REM %MV% cifar-10-batches-bin\* . && %RM% -rf cifar-10-batches-bin && %RM% -r cifar-10-batches-bin
REM %RM% -r cifar-10-batches-bin

REM Creation is split out because leveldb sometimes causes segfault
REM and needs to be re-created.

ECHO "Done."
pause