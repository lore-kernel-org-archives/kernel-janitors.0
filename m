From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 08 Jul 2010 12:09:54 +0000
Subject: [PATCH 1/4] ax88796: free irq on error
Message-Id: <1278590996-3122-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>, "David S. Miller" <davem@davemloft.net>, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, netdev@vger.kernel.org

If ax_ei_open() failed we must free previously requested irq.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/ax88796.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ax88796.c b/drivers/net/ax88796.c
index 55c9958..20e946b 100644
--- a/drivers/net/ax88796.c
+++ b/drivers/net/ax88796.c
@@ -481,8 +481,10 @@ static int ax_open(struct net_device *dev)
 		return ret;
 
 	ret = ax_ei_open(dev);
-	if (ret)
+	if (ret) {
+		free_irq(dev->irq, dev);
 		return ret;
+	}
 
 	/* turn the phy on (if turned off) */
 
-- 
1.7.0.4

