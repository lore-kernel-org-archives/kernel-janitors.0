From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Mon, 21 Jul 2008 19:20:32 +0000
Subject: Re: [PATCH] v4l: replace __FUNCTION__ with __func__
Message-Id: <20080721192032.GB18891@orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080720223108.GC31640@orion>
In-Reply-To: <20080720223108.GC31640@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>

v4l: replace __FUNCTION__ with __func__


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 drivers/media/video/cx23885/cx23885-core.c |    2 +-
 include/media/saa7146.h                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/video/cx23885/cx23885-core.c b/drivers/media/video/cx23885/cx23885-core.c
index d17343e..5c20378 100644
--- a/drivers/media/video/cx23885/cx23885-core.c
+++ b/drivers/media/video/cx23885/cx23885-core.c
@@ -1311,7 +1311,7 @@ void cx23885_cancel_buffers(struct cx23885_tsport *port)
 	struct cx23885_dev *dev = port->dev;
 	struct cx23885_dmaqueue *q = &port->mpegq;
 
-	dprintk(1, "%s()\n", __FUNCTION__);
+	dprintk(1, "%s()\n", __func__);
 	del_timer_sync(&q->timeout);
 	cx23885_stop_dma(port);
 	do_cancel_buffers(port, "cancel", 0);
diff --git a/include/media/saa7146.h b/include/media/saa7146.h
index 2f68f4c..c0802c8 100644
--- a/include/media/saa7146.h
+++ b/include/media/saa7146.h
@@ -30,7 +30,7 @@ extern unsigned int saa7146_debug;
 	#define DEBUG_VARIABLE saa7146_debug
 #endif
 
-#define DEBUG_PROLOG printk("%s: %s(): ",KBUILD_MODNAME,__FUNCTION__)
+#define DEBUG_PROLOG printk("%s: %s(): ",KBUILD_MODNAME,__func__)
 #define INFO(x) { printk("%s: ",KBUILD_MODNAME); printk x; }
 
 #define ERR(x) { DEBUG_PROLOG; printk x; }
