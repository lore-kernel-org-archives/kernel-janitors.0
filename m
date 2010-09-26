From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 09:58:31 +0000
Subject: [PATCH 9/9] staging: wlags49_h2: use free_netdev(netdev) instead of kfree()
Message-Id: <1285495111-22238-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, Henk de Groot <pe1dnn@amsat.org>, Andrew Morton <akpm@linux-foundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Freeing netdev without free_netdev() leads to net, tx leaks.
I might lead to dereferencing freed pointer.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

@@
struct net_device* dev;
@@

-kfree(dev)
+free_netdev(dev)
---
 Compile tested.

 drivers/staging/wlags49_h2/wl_netdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_netdev.c b/drivers/staging/wlags49_h2/wl_netdev.c
index e2a7ad0..954bece 100644
--- a/drivers/staging/wlags49_h2/wl_netdev.c
+++ b/drivers/staging/wlags49_h2/wl_netdev.c
@@ -1586,7 +1586,7 @@ void wl_wds_device_dealloc( struct wl_private *lp )
                 dev_wds->flags &= ~( IFF_UP | IFF_RUNNING );
             }
 
-            kfree( dev_wds );
+            free_netdev(dev_wds);
             lp->wds_port[count].dev = NULL;
         }
     }
-- 
1.7.0.4

