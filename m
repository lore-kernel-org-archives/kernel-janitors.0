From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:29:18 +0000
Subject: [Kernel-janitors] [PATCH] sbus/envctrl: replace schedule_timeout()
Message-Id: <20040727222917.GJ3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98103561154417129=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98103561154417129==
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

Description: Replace schedule_timeout() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/sbus/char/envctrl.c	2004-06-16 05:18:59.000000000 +0000
+++ linux-dev/drivers/sbus/char/envctrl.c	2004-07-12 22:35:19.000000000 +0000
@@ -1181,8 +1181,7 @@ static void __exit envctrl_cleanup(void)
 			if (!found)
 				break;
 
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ);
+			msleep(1000);
 		}
 		kenvctrld_task = NULL;
 	}

--===============98103561154417129==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98103561154417129==--
