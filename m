From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 20:48:07 +0000
Subject: [Kernel-janitors] [PATCH] cdu31a: replace schedule_timeout() with
Message-Id: <20040720204807.GA2959@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============038238877291641771=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============038238877291641771==
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
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/cdrom/cdu31a.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/cdrom/cdu31a.c	2004-07-10 18:23:50.000000000 +0000
@@ -729,8 +729,7 @@ static void restart_on_error(void)
 		       res_reg[1]);
 	}
 
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(2 * HZ);
+	msleep(2000);
 
 	sony_get_toc();
 }
@@ -960,8 +959,7 @@ retry_cd_operation:
 	if (((result_buffer[0] & 0xf0) == 0x20)
 	    && (num_retries < MAX_CDU31A_RETRIES)) {
 		num_retries++;
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ / 10);	/* Wait .1 seconds on retries */
+		msleep(100):
 		goto retry_cd_operation;
 	}
 

--===============038238877291641771==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============038238877291641771==--
