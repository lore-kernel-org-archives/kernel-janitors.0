From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Feb 2019 08:42:14 +0000
Subject: [PATCH v2] net: ns83820: drop pointless static qualifier in ns83820_probe_phy()
Message-Id: <20190219084214.96202-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1902190929250.2570@hadrien>
In-Reply-To: <alpine.DEB.2.21.1902190929250.2570@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org

There is no need to have the 'int first' static
since new value always be assigned before use it.

This patch cleans up the codes in ns83820_probe_phy() as well.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2: delete unused codes.
 drivers/net/ethernet/natsemi/ns83820.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 958fced4dacf..37694f6843fe 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1869,23 +1869,11 @@ static unsigned ns83820_mii_write_reg(struct ns83820 *dev, unsigned phy, unsigne
 static void ns83820_probe_phy(struct net_device *ndev)
 {
 	struct ns83820 *dev = PRIV(ndev);
-	static int first;
+	int first;
 	int i;
 #define MII_PHYIDR1	0x02
 #define MII_PHYIDR2	0x03
 
-#if 0
-	if (!first) {
-		unsigned tmp;
-		ns83820_mii_read_reg(dev, 1, 0x09);
-		ns83820_mii_write_reg(dev, 1, 0x10, 0x0d3e);
-
-		tmp = ns83820_mii_read_reg(dev, 1, 0x00);
-		ns83820_mii_write_reg(dev, 1, 0x00, tmp | 0x8000);
-		udelay(1300);
-		ns83820_mii_read_reg(dev, 1, 0x09);
-	}
-#endif
 	first = 1;
 
 	for (i=1; i<2; i++) {
@@ -1894,9 +1882,6 @@ static void ns83820_probe_phy(struct net_device *ndev)
 		a = ns83820_mii_read_reg(dev, i, MII_PHYIDR1);
 		b = ns83820_mii_read_reg(dev, i, MII_PHYIDR2);
 
-		//printk("%s: phy %d: 0x%04x 0x%04x\n",
-		//	ndev->name, i, a, b);
-
 		for (j=0; j<0x16; j+=4) {
 			dprintk("%s: [0x%02x] %04x %04x %04x %04x\n",
 				ndev->name, j,
-- 
2.20.1
