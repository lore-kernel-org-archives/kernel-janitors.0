From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:07:07 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 17/17] media/zr36120: replace
Message-Id: <20040920220707.GW2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8499843682551198=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8499843682551198==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/zr36120.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/zr36120.c	2004-09-14 17:04:44.000000000 -0700
@@ -819,8 +819,7 @@ void zoran_close(struct video_device* de
          *      be sure its safe to free the buffer. We wait 5-6 fields
          *      which is more than sufficient to be sure.
          */
-        current->state = TASK_UNINTERRUPTIBLE;
-        schedule_timeout(HZ/10);        /* Wait 1/10th of a second */
+        msleep(100);			/* Wait 1/10th of a second */
 
 	/* free the allocated framebuffer */
 	if (ztv->fbuffer)
@@ -1568,8 +1567,7 @@ void vbi_close(struct video_device *dev)
          *      be sure its safe to free the buffer. We wait 5-6 fields
          *      which is more than sufficient to be sure.
          */
-        current->state = TASK_UNINTERRUPTIBLE;
-        schedule_timeout(HZ/10);        /* Wait 1/10th of a second */
+        msleep(100);			/* Wait 1/10th of a second */
 
 	for (item=ztv->readinfo; item!=ztv->readinfo+ZORAN_VBI_BUFFERS; item++)
 	{

--===============8499843682551198==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8499843682551198==--
