From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:59:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/4] mtd/cfi_cmdset_0020:
Message-Id: <20040920235909.GG2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43277590407590205=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43277590407590205==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/mtd/chips/cfi_cmdset_0020.c	2004-09-09 23:05:53.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/mtd/chips/cfi_cmdset_0020.c	2004-09-10 14:17:13.000000000 -0700
@@ -788,7 +788,7 @@ retry:
 	chip->state = FL_ERASING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
@@ -1087,7 +1087,7 @@ retry:
 	chip->state = FL_LOCKING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
@@ -1236,7 +1236,7 @@ retry:
 	chip->state = FL_UNLOCKING;
 	
 	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
+	msleep(1000);
 	spin_lock_bh(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */

--===============43277590407590205==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43277590407590205==--
