From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2012 06:59:48 +0000
Subject: [patch] [media] stk1160: unlock on error path stk1160_set_alternate()
Message-Id: <20120814065948.GD4791@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There are some unlocks missing on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies on top of linux-next.

diff --git a/drivers/media/video/stk1160/stk1160-v4l.c b/drivers/media/video/stk1160/stk1160-v4l.c
index 360bdbe..1ad4ac1 100644
--- a/drivers/media/video/stk1160/stk1160-v4l.c
+++ b/drivers/media/video/stk1160/stk1160-v4l.c
@@ -159,8 +159,9 @@ static bool stk1160_set_alternate(struct stk1160 *dev)
 
 static int stk1160_start_streaming(struct stk1160 *dev)
 {
-	int i, rc;
 	bool new_pkt_size;
+	int rc = 0;
+	int i;
 
 	/* Check device presence */
 	if (!dev->udev)
@@ -183,7 +184,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 	if (!dev->isoc_ctl.num_bufs || new_pkt_size) {
 		rc = stk1160_alloc_isoc(dev);
 		if (rc < 0)
-			return rc;
+			goto out_unlock;
 	}
 
 	/* submit urbs and enables IRQ */
@@ -192,7 +193,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
 			stk1160_uninit_isoc(dev);
-			return rc;
+			goto out_unlock;
 		}
 	}
 
@@ -205,9 +206,10 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	stk1160_dbg("streaming started\n");
 
+out_unlock:
 	mutex_unlock(&dev->v4l_lock);
 
-	return 0;
+	return rc;
 }
 
 /* Must be called with v4l_lock hold */
