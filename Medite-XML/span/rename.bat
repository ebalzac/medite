@echo off
setlocal enableDelayedExpansion
for %%F in (*-span.xml) do (
  set "name=%%F"
  rename "!name!" "!name:-span=!"
)
