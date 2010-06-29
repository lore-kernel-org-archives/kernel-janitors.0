From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:52 +0000
Subject: [PATCH 15/25] linux: remove casts from void*
Message-Id: <1277806553-31214-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bob Beers <bob.beers@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/cxt1e1/linux.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/cxt1e1/linux.c b/drivers/staging/cxt1e1/linux.c
index 134e756..baa4b54 100644
--- a/drivers/staging/cxt1e1/linux.c
+++ b/drivers/staging/cxt1e1/linux.c
@@ -461,7 +461,7 @@ chan_get_stats (struct net_device * ndev)
     {
         struct c4_priv *priv;
 
-        priv = (struct c4_priv *) dev_to_hdlc (ndev)->priv;
+        priv = dev_to_hdlc (ndev)->priv;
         channum = priv->channum;
     }
 #endif
@@ -886,7 +886,7 @@ do_deluser (struct net_device * ndev, int lockit)
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
         priv = DEV_TO_PRIV (ndev);
 #else
-        priv = (struct c4_priv *) dev_to_hdlc (ndev)->priv;
+        priv = dev_to_hdlc (ndev)->priv;
 #endif
         ci = priv->ci;
         channum = priv->channum;
-- 
1.7.0.4

