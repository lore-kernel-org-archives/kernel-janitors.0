From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:04:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 14/17] media/saa7134-tvaudio:
Message-Id: <20040920220442.GT2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78554378238368905=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78554378238368905==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/saa7134/saa7134-tvaudio.c	2004-09-13 17:15:39.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/saa7134/saa7134-tvaudio.c	2004-09-17 14:53:18.000000000 -0700
@@ -324,11 +324,12 @@ static int tvaudio_sleep(struct saa7134_
 	
 	add_wait_queue(&dev->thread.wq, &wait);
 	if (dev->thread.scan1 == dev->thread.scan2 && !dev->thread.shutdown) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (timeout < 0)
+		if (timeout < 0) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule();
+		}
 		else
-			schedule_timeout(timeout);
+			msleep_interruptible(jiffies_to_msecs(timeout));
 	}
 	remove_wait_queue(&dev->thread.wq, &wait);
 	return dev->thread.scan1 != dev->thread.scan2;

--===============78554378238368905==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78554378238368905==--
