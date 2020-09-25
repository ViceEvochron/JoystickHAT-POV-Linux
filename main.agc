            dim jhatpov[10,1]
            
            CompleteRawJoystickDetection()
            ii=1  ` change to align with device ID as needed
            
            repeat
                ClearScreen()
                
                rem Linux mode POV/HAT input
                LinuxJoyY=GetRawJoystickSlider(ii,1)
                LinuxHat1=GetRawJoystickPOV(ii,0)
          
                jhatpov[ii,0]=0  ` idle
                if LinuxJoyY=0 and LinuxHat1=-32767 then jhatpov[ii,0]=1  ` up
                if LinuxJoyY=32767 and LinuxHat1=-32767 then jhatpov[ii,0]=2  ` up + right
                if LinuxJoyY=32767 and LinuxHat1=0 then jhatpov[ii,0]=3  ` right
                if LinuxJoyY=32767 and LinuxHat1=32767 then jhatpov[ii,0]=4  ` right + down
                if LinuxJoyY=0 and LinuxHat1=32767 then jhatpov[ii,0]=5  ` down
                if LinuxJoyY=-32767 and LinuxHat1=32767 then jhatpov[ii,0]=6  ` left + down
                if LinuxJoyY=-32767 and LinuxHat1=0 then jhatpov[ii,0]=7  ` left
                if LinuxJoyY=-32767 and LinuxHat1=-32767 then jhatpov[ii,0]=8  ` up + left
                
                Print("JoyY = "+str(LinuxJoyY))
                Print("Hat1 = "+str(LinuxHat1))
                Print("HAT Output = "+str(jhatpov[ii,0]))

                Sync()
            until GetRawKeyState(27)>0
