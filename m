From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:25:35 +0000
Subject: [Kernel-janitors] [PATCH] ide-tape: replace schedule_timeout() with
Message-Id: <20040722222535.GS2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97152163336073483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97152163336073483==
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


--- linux-vanilla/drivers/ide/ide-tape.c	2004-06-16 05:19:10.000000000 +0000
+++ linux-dev/drivers/ide/ide-tape.c	2004-07-12 18:06:33.000000000 +0000
@@ -2932,8 +2932,7 @@ static int idetape_wait_ready(ide_drive_
 		} else if (!(tape->sense_key == 2 && tape->asc == 4 &&
 			     (tape->ascq == 1 || tape->ascq == 8)))
 			return -EIO;
-		current->state = TASK_INTERRUPTIBLE;
-  		schedule_timeout(HZ / 10);
+		msleep(100);
 	}
 	return -EIO;
 }

--===============97152163336073483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97152163336073483==--
