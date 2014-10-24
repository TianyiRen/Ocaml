open NetKAT.Std
let policy1 : policy = 
<:netkat<
	if port = 1 then port := 2
	else if port = 2 then port := 1
	else drop
>>

let policy2 : policy = 
<:netkat<
	if port = 1 then port := 2 + port := 3
	else if port = 2 then port := 3 + port := 1
	else if port = 3 then port := 1 + port := 2
	else drop
>>
let policy3 : policy = 
<:netkat<
	if port = 1 then port := 2 + port := 3
	else if port = 2 then port := 3 + port := 1
	else if port = 3 then port := 1 + port := 2
	else drop
>>


let tree : policy = 
<:netkat<
  if switch = 1 then
	$policy1
  else if switch = 2 then 
	$policy2
  else if switch = 3 then
   	$policy3
  else
    drop
>>

let _ = run_static tree
