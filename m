From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:58:27 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/17] media/planb: replace
Message-Id: <20040920215827.GO2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82978217294406909=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82978217294406909==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/planb.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/planb.c	2004-09-14 16:42:06.000000000 -0700
@@ -178,8 +178,7 @@ static unsigned char saa_status(int byte
 	saa_write_reg (SAA7196_STDC, saa_regs[pb->win.norm][SAA7196_STDC]);
 
 	/* Let's wait 30msec for this one */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(30 * HZ / 1000);
+	msleep_interruptible(30);
 
 	return (unsigned char)in_8 (&planb_regs->saa_status);
 }

--===============82978217294406909==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82978217294406909==--
