From: Dan Carpenter <error27@gmail.com>
Date: Fri, 24 Dec 2010 05:17:34 +0000
Subject: [patch] skfp: testing the wrong variable in skfp_driver_init()
Message-Id: <20101224051734.GO1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jpirko@redhat.com>, Eric Dumazet <eric.dumazet@gmail.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

The intent here was to test if the allocation failed but we tested 
"SharedMemSize" instead of "SharedMemAddr" by mistake.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/skfp/skfddi.c b/drivers/net/skfp/skfddi.c
index 0a66fed..16c6265 100644
--- a/drivers/net/skfp/skfddi.c
+++ b/drivers/net/skfp/skfddi.c
@@ -412,7 +412,7 @@ static  int skfp_driver_init(struct net_device *dev)
 		bp->SharedMemAddr = pci_alloc_consistent(&bp->pdev,
 							 bp->SharedMemSize,
 							 &bp->SharedMemDMA);
-		if (!bp->SharedMemSize) {
+		if (!bp->SharedMemAddr) {
 			printk("could not allocate mem for ");
 			printk("hardware module: %ld byte\n",
 			       bp->SharedMemSize);
