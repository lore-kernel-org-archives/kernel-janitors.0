From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 May 2012 20:56:46 +0000
Subject: [patch] Staging: wlags49_h2: potential NULL dereference
Message-Id: <20120514205646.GC20836@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

wl_device_dealloc() dereferences the "dev" paramter, so let's move it
under the check for NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I don't know if "dev" can actually be NULL here.

diff --git a/drivers/staging/wlags49_h2/wl_cs.c b/drivers/staging/wlags49_h2/wl_cs.c
index 7084f41..7c7c77f 100644
--- a/drivers/staging/wlags49_h2/wl_cs.c
+++ b/drivers/staging/wlags49_h2/wl_cs.c
@@ -177,10 +177,9 @@ static void wl_adapter_detach(struct pcmcia_device *link)
 	if (dev) {
 		unregister_wlags_sysfs(dev);
 		unregister_netdev(dev);
+		wl_device_dealloc(dev);
 	}
 
-	wl_device_dealloc(dev);
-
 	DBG_LEAVE(DbgInfo);
 } /* wl_adapter_detach */
 /*======================================*/
