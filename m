From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:48:23 +0000
Subject: [Kernel-janitors] [PATCH] wan/cosa: replace schedule_timeout() with
Message-Id: <20040727204823.GD3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033709222112741299=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============033709222112741299==
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


--- linux-vanilla/drivers/net/wan/cosa.c	2004-06-16 05:18:52.000000000 +0000
+++ linux-dev/drivers/net/wan/cosa.c	2004-07-12 21:45:08.000000000 +0000
@@ -1563,8 +1563,7 @@ static int cosa_reset_and_read_id(struct
 	cosa_getdata8(cosa);
 	cosa_putstatus(cosa, SR_RST);
 #ifdef MODULE
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ/2);
+	msleep(500);
 #else
 	udelay(5*100000);
 #endif

--===============033709222112741299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033709222112741299==--
