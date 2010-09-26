From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 09:58:25 +0000
Subject: [PATCH 7/9] staging: otus: use free_netdev(netdev) instead of kfree()
Message-Id: <1285495105-22154-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Tejun Heo <tj@kernel.org>, Jeff Mahoney <jeffm@suse.com>, Mithlesh Thukral <mithlesh@linsyssoft.com>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

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

 drivers/staging/otus/usbdrv.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/otus/usbdrv.c b/drivers/staging/otus/usbdrv.c
index 165a82b..9a5c415 100644
--- a/drivers/staging/otus/usbdrv.c
+++ b/drivers/staging/otus/usbdrv.c
@@ -690,7 +690,7 @@ void usbdrv_clear_structs(struct net_device *dev)
 
     kfree(macp);
 
-    kfree(dev);
+    free_netdev(dev);
 
 }
 
-- 
1.7.0.4

