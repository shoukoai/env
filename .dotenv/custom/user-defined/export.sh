export PATH="$PATH:/home/hanasuru/Public/Tools/john/run"
export LOCAL_IP=$(ifconfig wlp3s0 | grep inet | awk '$1=="inet" {print $2}')
export SSLKEYLOGFILE=/home/hanasuru/.local/log/sslkeylogfile
export PATH=$PATH:/home/hanasuru/Public/Tools/DidierStevensSuite
export PATH=$PATH:/home/hanasuru/Public/Tools/Forensic/autopsy/bin
export PATH=$PATH:/home/hanasuru/.dotnet
