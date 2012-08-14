From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 06:58:15 +0000
Subject: [patch] [media] em28xx: use after free in em28xx_v4l2_close()
Message-Id: <20120814065814.GB4791@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hans de Goede <hdegoede@redhat.com>, Gianluca Gennari <gennarone@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to move the unlock before the kfree(dev);

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to linux-next.

diff --git a/drivers/media/video/em28xx/em28xx-video.c b/drivers/media/video/em28xx/em28xx-video.c
index ecb23df..78d6ebd 100644
--- a/drivers/media/video/em28xx/em28xx-video.c
+++ b/drivers/media/video/em28xx/em28xx-video.c
@@ -2264,9 +2264,9 @@ static int em28xx_v4l2_close(struct file *filp)
 		if (dev->state & DEV_DISCONNECTED) {
 			em28xx_release_resources(dev);
 			kfree(dev->alt_max_pkt_size);
+			mutex_unlock(&dev->lock);
 			kfree(dev);
 			kfree(fh);
-			mutex_unlock(&dev->lock);
 			return 0;
 		}
 
