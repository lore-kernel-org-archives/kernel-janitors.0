From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:15:12 +0000
Subject: [Kernel-janitors] [PATCH] video/zr36120: replace schedule_timeout()
Message-Id: <20040726231512.GY1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59899241277384796=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59899241277384796==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/zr36120.c	2004-06-16 05:19:23.000000000 +0000
+++ linux-dev/drivers/media/video/zr36120.c	2004-07-02 21:46:08.000000000 +0000
@@ -819,8 +819,7 @@ void zoran_close(struct video_device* de
          *      be sure its safe to free the buffer. We wait 5-6 fields
          *      which is more than sufficient to be sure.
          */
-        current->state = TASK_UNINTERRUPTIBLE;
-        schedule_timeout(HZ/10);        /* Wait 1/10th of a second */
+        msleep(100);			/* Wait 100ms */
 
 	/* free the allocated framebuffer */
 	if (ztv->fbuffer)
@@ -1568,8 +1567,7 @@ void vbi_close(struct video_device *dev)
          *      be sure its safe to free the buffer. We wait 5-6 fields
          *      which is more than sufficient to be sure.
          */
-        current->state = TASK_UNINTERRUPTIBLE;
-        schedule_timeout(HZ/10);        /* Wait 1/10th of a second */
+        msleep(100);			/* Wait 100ms */
 
 	for (item=ztv->readinfo; item!=ztv->readinfo+ZORAN_VBI_BUFFERS; item++)
 	{

--===============59899241277384796==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59899241277384796==--
