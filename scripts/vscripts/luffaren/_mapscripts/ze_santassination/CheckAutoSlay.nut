// Script by Luffaren (STEAM_0:1:22521282)
marathon <- false;

function CheckAutoSlay(stageind)
{
	if(marathon ==true)
	{
		local ctc_check = 0;
		local tc_check = 0;
		local p = null;
		while(null != (p = Entities.FindByClassname(p,"player")))
		{
			if(p!=null&&p.IsValid()&&p.GetHealth()>0)
			{
				if(p.GetTeam()==2)tc_check++;
				else if(p.GetTeam()==3)ctc_check++;
			}
		}
	}
		if(ctc_check>0&&tc_check>0)
		{
			local ccratio = ctc_check/tc_check;
			if(stageind==0&&ccratio<2.50||		//0 = prologue		>	46ct / 18t
			stageind==1&&ccratio<1.60||			//1 = act1	>	40ct / 24t
			stageind==2&&ccratio<1.20)		//2 = act2		>	35ct / 29t
			{
				EntFire("server","Command","say ***NOT ENOUGH HUMANS - SLAYING TO SAVE TIME***",0.00,null);
				EntFire("server","Command","say ***NOT ENOUGH HUMANS - SLAYING TO SAVE TIME***",0.02,null);
				EntFire("server","Command","say ***NOT ENOUGH HUMANS - SLAYING TO SAVE TIME***",0.04,null);
				KillAllCT();
			}
		}
		EntFire("server", "Command", "say << Human alive : "+ctc_check.tostring()+"/"+(ctc_check+tc_check).tostring()+" >>", 0.00,null);
		EntFire("server", "Command", "say << Human alive : "+ctc_check.tostring()+"/"+(ctc_check+tc_check).tostring()+" >>", 0.02,null);
		EntFire("server", "Command", "say << Human alive : "+ctc_check.tostring()+"/"+(ctc_check+tc_check).tostring()+" >>", 0.04,null);
		
	if(marathon==false)
	{
		return;
	}
}

function KillAllCT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == 3 && p.GetHealth()>0)
			EntFireByHandle(p, "SetHealth", "-999", 0.00, null, null);
	}
}
