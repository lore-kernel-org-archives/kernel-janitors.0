From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:49:45 +0000
Subject: [patch] video/et61x251: improve error handling
Message-Id: <20100328114945.GV5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Risolia <luca.risolia@studio.unibo.it>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexey Dobriyan <adobriyan@gmail.com>, Andreas Mohr <andi@lisas.de>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code doesn't handle the situation where the controller is
not found.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/et61x251/et61x251_core.c b/drivers/media/video/et61x251/et61x251_core.c
index e6c23d5..a5cfc76 100644
--- a/drivers/media/video/et61x251/et61x251_core.c
+++ b/drivers/media/video/et61x251/et61x251_core.c
@@ -1713,7 +1713,7 @@ et61x251_vidioc_s_ctrl(struct et61x251_device* cam, void __user * arg)
 	if (copy_from_user(&ctrl, arg, sizeof(ctrl)))
 		return -EFAULT;
 
-	for (i = 0; i < ARRAY_SIZE(s->qctrl); i++)
+	for (i = 0; i < ARRAY_SIZE(s->qctrl); i++) {
 		if (ctrl.id = s->qctrl[i].id) {
 			if (s->qctrl[i].flags & V4L2_CTRL_FLAG_DISABLED)
 				return -EINVAL;
@@ -1723,7 +1723,9 @@ et61x251_vidioc_s_ctrl(struct et61x251_device* cam, void __user * arg)
 			ctrl.value -= ctrl.value % s->qctrl[i].step;
 			break;
 		}
-
+	}
+	if (i = ARRAY_SIZE(s->qctrl))
+		return -EINVAL;
 	if ((err = s->set_ctrl(cam, &ctrl)))
 		return err;
 
