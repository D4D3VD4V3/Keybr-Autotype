
#NoEnv
SetBatchLines, -1
SetKeyDelay, 0

spl:=Chr(9251)

WB := ComObjCreate("InternetExplorer.Application")
;wb.navigate("www.keybr.com/multiplayer")
WB.Navigate("http://www.keybr.com/#!game")

while, wb.busy
Sleep, 100
 
WB.Visible := True
Gosub, sub

SUB:
classes := WB.document.getElementsByclassName("item")
Loop, % classes.length
{
	if Text:=classes[a_index-1].innertext
	{
		;(text!=%spl%)?SendInput,%text%:Sendinput, {space}
		;text==%spl%?SendInput {space}:SendInput %text%
		
			if text!=%spl%
				SendInput, %text%
			else
				SendInput, {space}
				
	}
}
Gosub, sub
return

Esc::
ExitApp
return
