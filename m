From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:32 +0000
Subject: [PATCH 2/27] [media] au0828: Use setup_timer
Message-Id: <1419604558-29743-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a call to init_timer and accompanying intializations of
the timer's data and function fields to a call to setup_timer.

A simplified version of the semantic match that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression t,f,d;
@@

-t.function = f;
-t.data = d;
-init_timer(&t);
+setup_timer(&t,f,d);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/au0828/au0828-video.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 5f337b1..0b24791 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -2043,13 +2043,10 @@ int au0828_analog_register(struct au0828_dev *dev,
 	INIT_LIST_HEAD(&dev->vbiq.active);
 	INIT_LIST_HEAD(&dev->vbiq.queued);
 
-	dev->vid_timeout.function = au0828_vid_buffer_timeout;
-	dev->vid_timeout.data = (unsigned long) dev;
-	init_timer(&dev->vid_timeout);
-
-	dev->vbi_timeout.function = au0828_vbi_buffer_timeout;
-	dev->vbi_timeout.data = (unsigned long) dev;
-	init_timer(&dev->vbi_timeout);
+	setup_timer(&dev->vid_timeout, au0828_vid_buffer_timeout,
+		    (unsigned long)dev);
+	setup_timer(&dev->vbi_timeout, au0828_vbi_buffer_timeout,
+		    (unsigned long)dev);
 
 	dev->width = NTSC_STD_W;
 	dev->height = NTSC_STD_H;

