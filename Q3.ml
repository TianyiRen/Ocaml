open NetKAT.Std

let hub : policy = 
    <:netkat<
	if port = 1 then port := 2 + port:= 3 + port := 4
	else if port = 2 then port := 1 + port := 3 + port := 4
	else if port = 3 then port := 1 + port := 2 + port := 4
	else if port = 4 then port := 1 + port := 2 + port := 3
	else drop
	>>
let flood : policy = 
    <:netkat<
	if (ip4Src = 10.0.0.1 && (ip4Dst = 10.0.0.3 || ip4Dst = 10.0.0.4) && ethType = 0x0800 && ipProto = 0x06 && tcpDstPort = 22) then drop
	else $hub
	>>
let _ = run_static flood	
