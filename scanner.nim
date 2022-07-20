import net

proc portScan*(PNUM: int, targetIP: string) =
  var a = 0
  var client = newSocket()
  try:
    client.connect(targetIP, Port(PNUM), 110)
    a = 1
  except OSError as e:
    discard e
  except TimeoutError as TE:
    discard TE
  finally:
    if a == 1:
      echo "Port Open: ", PNUM
