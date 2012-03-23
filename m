From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 23 Mar 2012 09:53:45 +0000
Subject: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <1332495705-31337-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Replace kmalloc+memset pair by kzalloc() in 'wl_wds_device_alloc()'.
Add error handling to avoid null derefernce.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/staging/wlags49_h2/wl_netdev.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_netdev.c b/drivers/staging/wlags49_h2/wl_netdev.c
index 9c16f54..426ba04 100644
--- a/drivers/staging/wlags49_h2/wl_netdev.c
+++ b/drivers/staging/wlags49_h2/wl_netdev.c
@@ -1511,8 +1511,12 @@ void wl_wds_device_alloc( struct wl_private *lp )
     for( count = 0; count < NUM_WDS_PORTS; count++ ) {
         struct net_device *dev_wds = NULL;
 
-        dev_wds = kmalloc( sizeof( struct net_device ), GFP_KERNEL );
-        memset( dev_wds, 0, sizeof( struct net_device ));
+	dev_wds = kzalloc(sizeof(struct net_device), GFP_KERNEL);
+	if (unlikely(!dev_wds)) {
+		printk(KERN_ERR "%s: failed to alloc memory\n", __func__);
+		DBG_LEAVE(DbgInfo);
+		return;
+	}
 
         ether_setup( dev_wds );
 
-- 
1.7.4.4

