From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 09:58:18 +0000
Subject: [PATCH 5/9] staging: ath6kl: use free_netdev(netdev) instead of kfree()
Message-Id: <1285495099-22069-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Vipin Mehta <vmehta@atheros.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

It is not guaranteed that free_netdev() is macro.
Freeing netdev without free_netdev() leads to net, tx leaks.
I might lead to dereferencing freed pointer.

---
 drivers/staging/ath6kl/os/linux/ar6000_drv.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/ath6kl/os/linux/ar6000_drv.c b/drivers/staging/ath6kl/os/linux/ar6000_drv.c
index daba6e4..c5a6d6c 100644
--- a/drivers/staging/ath6kl/os/linux/ar6000_drv.c
+++ b/drivers/staging/ath6kl/os/linux/ar6000_drv.c
@@ -2143,11 +2143,7 @@ ar6000_destroy(struct net_device *dev, unsigned int unregister)
         unregister_netdev(dev);
         is_netdev_registered = 0;
     }
-#ifndef free_netdev
-    kfree(dev);
-#else
     free_netdev(dev);
-#endif
 
 #ifdef ATH6K_CONFIG_CFG80211
     ar6k_cfg80211_deinit(ar);
@@ -6429,11 +6425,7 @@ A_STATUS ar6000_remove_ap_interface(AR_SOFTC_T *ar)
         ar6000_stop_ap_interface(ar);
 
         unregister_netdev(arApNetDev);
-#ifndef free_netdev
-        kfree(arApNetDev);
-#else
         free_netdev(apApNetDev);
-#endif
 
         A_PRINTF("Remove AP interface\n");
     }
-- 
1.7.0.4

