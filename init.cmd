@echo off
pushd init
for %%a in (*.sh) do call ..\runsh %%a
popd