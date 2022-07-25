import scanner, os, strutils

let numParams = paramCount()

proc usage() =
  echo """
    ###########################################################
    # Usage:                                                  #
    # ./NimScan <targetIP/hostname> <START_port> <END_port>   #
    #                                                         #
    #---------------------------------------------------------#
    # Example:                                                #
    # ./NimScan 192.168.1.140 21 1024                         #
    #                                                         #
    ###########################################################"""

proc main() =
  if numParams > 0:
    var targetIP:string = paramStr(1)
    let startPort =  paramStr(2)
    let endPort = paramStr(3)

    let startPort_INT = parseInt(startPort)
    let endPort_INT = parseInt(endPort)
    
    if startPort > endPort:
      echo "[!] Cannot have starting port number be higher than end port!"
      echo ""
      usage()
    else:
      echo ""
      echo "Nim Port Scanner"
      echo "================"
      for PNUM in startPort_INT .. endPort_INT:
        portScan(PNUM, targetIP)
  else:
    write(stdout, "Target Hostname|IP: ")
    let targetIP = readLine(stdin)
    write(stdout, "START Port: ")
    let startPort = readLine(stdin)
    write(stdout, "END Port: ")
    let endPort = readLine(stdin)

    let startPort_INT = parseInt(startPort)
    let endPort_INT = parseInt(endPort)
    echo ""
    echo "Nim Port Scanner"
    echo "================"
    for PNUM in startPort_int .. endPort_INT:
      portScan(PNUM, targetIP)

main()
 
