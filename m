From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:06:33 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 16/17] media/zoran_driver:
Message-Id: <20040920220633.GV2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42934386979619377=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42934386979619377==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/zoran_driver.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/zoran_driver.c	2004-09-14 16:51:17.000000000 -0700
@@ -1917,8 +1917,7 @@ zoran_set_norm (struct zoran *zr,
 		decoder_command(zr, DECODER_SET_NORM, &norm);
 
 		/* let changes come into effect */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(2 * HZ);
+		ssleep(2);
 
 		decoder_command(zr, DECODER_GET_STATUS, &status);
 		if (!(status & DECODER_STATUS_GOOD)) {
@@ -2639,8 +2638,7 @@ zoran_do_ioctl (struct inode *inode,
 		decoder_command(zr, DECODER_SET_NORM, &norm);
 
 		/* sleep 1 second */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(1 * HZ);
+		ssleep(1);
 
 		/* Get status of video decoder */
 		decoder_command(zr, DECODER_GET_STATUS, &status);

--===============42934386979619377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42934386979619377==--
