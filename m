From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:27:14 +0000
Subject: [Kernel-janitors] [PATCH] sbus/bbc_envctrl: replace
Message-Id: <20040727222714.GI3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74711201917632863=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74711201917632863==
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


--- linux-vanilla/drivers/sbus/char/bbc_envctrl.c	2004-06-15 22:19:17.000000000 -0700
+++ linux-dev/drivers/sbus/char/bbc_envctrl.c	2004-07-27 15:26:02.000000000 -0700
@@ -622,9 +622,7 @@ void bbc_envctrl_cleanup(void)
 			read_unlock(&tasklist_lock);
 			if (!found)
 				break;
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ);
-			current->state = TASK_RUNNING;
+			msleep(1000);
 		}
 		kenvctrld_task = NULL;
 	}

--===============74711201917632863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74711201917632863==--
