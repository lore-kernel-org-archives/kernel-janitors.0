From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:12:11 +0000
Subject: [Kernel-janitors] [PATCH] parport/parport_pc: replace
Message-Id: <20040727211211.GN3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58733516194151481=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58733516194151481==
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

--- linux-vanilla/drivers/parport/parport_pc.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/parport/parport_pc.c	2004-07-12 22:09:32.000000000 +0000
@@ -168,8 +168,7 @@ static int change_mode(struct parport *p
 				if (time_after_eq (jiffies, expire))
 					/* The FIFO is stuck. */
 					return -EBUSY;
-				__set_current_state (TASK_INTERRUPTIBLE);
-				schedule_timeout ((HZ + 99) / 100);
+				msleep(10);
 				if (signal_pending (current))
 					break;
 			}

--===============58733516194151481==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58733516194151481==--
