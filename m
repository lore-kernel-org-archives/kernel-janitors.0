From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:13:53 +0000
Subject: [Kernel-janitors] [PATCH] video/zoran_device: replace
Message-Id: <20040726231352.GX1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87169748741849196=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726231143.GW1897@us.ibm.com>
In-Reply-To: <20040726231143.GW1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============87169748741849196==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/zoran_driver.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/media/video/zoran_driver.c	2004-07-02 21:45:17.000000000 +0000
@@ -1919,8 +1919,7 @@ zoran_set_norm (struct zoran *zr,
 		decoder_command(zr, DECODER_SET_NORM, &norm);
 
 		/* let changes come into effect */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(2 * HZ);
+		msleep(2000);
 
 		decoder_command(zr, DECODER_GET_STATUS, &status);
 		if (!(status & DECODER_STATUS_GOOD)) {
@@ -2641,8 +2640,7 @@ zoran_do_ioctl (struct inode *inode,
 		decoder_command(zr, DECODER_SET_NORM, &norm);
 
 		/* sleep 1 second */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(1 * HZ);
+		msleep(1000);
 
 		/* Get status of video decoder */
 		decoder_command(zr, DECODER_GET_STATUS, &status);

--===============87169748741849196==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87169748741849196==--
