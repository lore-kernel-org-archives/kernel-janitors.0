From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Nov 2017 14:11:49 +0000
Subject: [PATCH] net: via: via-rhine: use %p to format void * address instead of %x
Message-Id: <20171129141149.21705-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't use %x and casting to print out an address, instead use %p
and remove the casting.  Cleans up smatch warnings:

drivers/net/ethernet/via/via-rhine.c:998 rhine_init_one_common()
warn: argument 4 to %lx specifier is cast from pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/via/via-rhine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index 83e6f76eb965..33949248c829 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -995,8 +995,8 @@ static int rhine_init_one_common(struct device *hwdev, u32 quirks,
 	else
 		name = "Rhine III";
 
-	netdev_info(dev, "VIA %s at 0x%lx, %pM, IRQ %d\n",
-		    name, (long)ioaddr, dev->dev_addr, rp->irq);
+	netdev_info(dev, "VIA %s at %p, %pM, IRQ %d\n",
+		    name, ioaddr, dev->dev_addr, rp->irq);
 
 	dev_set_drvdata(hwdev, dev);
 
-- 
2.14.1

