From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:48:48 +0000
Subject: [Kernel-janitors] [PATCH] hotplug/shpchp_hpc: replace
Message-Id: <20040727214848.GV3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61908461403756698=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61908461403756698==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pci/hotplug/shpchp_hpc.c	2004-06-16 05:19:09.000000000 +0000
+++ linux-dev/drivers/pci/hotplug/shpchp_hpc.c	2004-07-12 22:19:24.000000000 +0000
@@ -300,8 +300,7 @@ static int shpc_write_cmd(struct slot *s
 		if (!(cmd_status & 0x1))
 			break;
 		/*  Check every 0.1 sec for a total of 1 sec*/
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
 
 	cmd_status = readw(php_ctlr->creg + CMD_STATUS);

--===============61908461403756698==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61908461403756698==--
