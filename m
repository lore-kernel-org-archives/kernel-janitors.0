From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 21:39:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/33] char/epca: replace
Message-Id: <20040915213927.GJ5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77927243993623541=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77927243993623541==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/epca.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/epca.c	2004-09-10 10:36:28.000000000 -0700
@@ -563,8 +563,7 @@ static void pc_close(struct tty_struct *
 
 			if (ch->close_delay) 
 			{
-				current->state = TASK_INTERRUPTIBLE;
-				schedule_timeout(ch->close_delay);
+				msleep_interruptible(jiffies_to_msecs(ch->close_delay));
 			}
 
 			wake_up_interruptible(&ch->open_wait);

--===============77927243993623541==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77927243993623541==--
