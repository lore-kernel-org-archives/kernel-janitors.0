From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:54:55 +0000
Subject: [Kernel-janitors] [PATCH] video/planb: replace schedule_timeout()
Message-Id: <20040726225455.GR1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============03015145565898214=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============03015145565898214==
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

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/planb.c	2004-06-16 05:19:51.000000000 +0000
+++ linux-dev/drivers/media/video/planb.c	2004-07-12 18:54:09.000000000 +0000
@@ -178,8 +178,7 @@ static unsigned char saa_status(int byte
 	saa_write_reg (SAA7196_STDC, saa_regs[pb->win.norm][SAA7196_STDC]);
 
 	/* Let's wait 30msec for this one */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(30 * HZ / 1000);
+	msleep(30);
 
 	return (unsigned char)in_8 (&planb_regs->saa_status);
 }

--===============03015145565898214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============03015145565898214==--
