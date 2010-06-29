From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:25 +0000
Subject: [PATCH 23/25] wl_netdev: remove casts from void*
Message-Id: <1277806586-31486-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Henk de Groot <pe1dnn@amsat.org>, Andrew Morton <akpm@linux-foundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/wlags49_h2/wl_netdev.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_netdev.c b/drivers/staging/wlags49_h2/wl_netdev.c
index 1aa61db..e2a7ad0 100644
--- a/drivers/staging/wlags49_h2/wl_netdev.c
+++ b/drivers/staging/wlags49_h2/wl_netdev.c
@@ -1905,8 +1905,8 @@ int wl_rx_dma( struct net_device *dev )
     DBG_FUNC("wl_rx")
     DBG_PARAM(DbgInfo, "dev", "%s (0x%p)", dev->name, dev);
 
-    if((( lp = (struct wl_private *)dev->priv ) != NULL ) &&
-          !( lp->flags & WVLAN2_UIL_BUSY )) {
+    if((( lp = dev->priv ) != NULL ) &&
+	!( lp->flags & WVLAN2_UIL_BUSY )) {
 
 #ifdef USE_RTS
         if( lp->useRTS = 1 ) {
-- 
1.7.0.4

