From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Feb 2019 13:45:10 +0000
Subject: [PATCH v4] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <20190219134510.51835-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr, wharms@bfs.de

This patch is to do code cleanup for ns83820_probe_phy().
It deletes unused variable 'first', commented out code,
and the pointless 'for' loop.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Julia Lawall <julia.lawall@lip6.fr>
---
 v3->v4: delete pointless 'for' loop, variable 'i', and so on.
 drivers/net/ethernet/natsemi/ns83820.c | 70 ++++++++------------------
 1 file changed, 21 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 958fced4dacf..959c0fa37d75 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1869,56 +1869,28 @@ static unsigned ns83820_mii_write_reg(struct ns83820 *dev, unsigned phy, unsigne
 static void ns83820_probe_phy(struct net_device *ndev)
 {
 	struct ns83820 *dev = PRIV(ndev);
-	static int first;
-	int i;
-#define MII_PHYIDR1	0x02
-#define MII_PHYIDR2	0x03
-
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
-	first = 1;
-
-	for (i=1; i<2; i++) {
-		int j;
-		unsigned a, b;
-		a = ns83820_mii_read_reg(dev, i, MII_PHYIDR1);
-		b = ns83820_mii_read_reg(dev, i, MII_PHYIDR2);
-
-		//printk("%s: phy %d: 0x%04x 0x%04x\n",
-		//	ndev->name, i, a, b);
-
-		for (j=0; j<0x16; j+=4) {
-			dprintk("%s: [0x%02x] %04x %04x %04x %04x\n",
-				ndev->name, j,
-				ns83820_mii_read_reg(dev, i, 0 + j),
-				ns83820_mii_read_reg(dev, i, 1 + j),
-				ns83820_mii_read_reg(dev, i, 2 + j),
-				ns83820_mii_read_reg(dev, i, 3 + j)
-				);
-		}
-	}
-	{
-		unsigned a, b;
-		/* read firmware version: memory addr is 0x8402 and 0x8403 */
-		ns83820_mii_write_reg(dev, 1, 0x16, 0x000d);
-		ns83820_mii_write_reg(dev, 1, 0x1e, 0x810e);
-		a = ns83820_mii_read_reg(dev, 1, 0x1d);
-
-		ns83820_mii_write_reg(dev, 1, 0x16, 0x000d);
-		ns83820_mii_write_reg(dev, 1, 0x1e, 0x810e);
-		b = ns83820_mii_read_reg(dev, 1, 0x1d);
-		dprintk("version: 0x%04x 0x%04x\n", a, b);
+	int j;
+	unsigned a, b;
+
+	for (j = 0; j < 0x16; j += 4) {
+		dprintk("%s: [0x%02x] %04x %04x %04x %04x\n",
+			ndev->name, j,
+			ns83820_mii_read_reg(dev, 1, 0 + j),
+			ns83820_mii_read_reg(dev, 1, 1 + j),
+			ns83820_mii_read_reg(dev, 1, 2 + j),
+			ns83820_mii_read_reg(dev, 1, 3 + j)
+			);
 	}
+
+	/* read firmware version: memory addr is 0x8402 and 0x8403 */
+	ns83820_mii_write_reg(dev, 1, 0x16, 0x000d);
+	ns83820_mii_write_reg(dev, 1, 0x1e, 0x810e);
+	a = ns83820_mii_read_reg(dev, 1, 0x1d);
+
+	ns83820_mii_write_reg(dev, 1, 0x16, 0x000d);
+	ns83820_mii_write_reg(dev, 1, 0x1e, 0x810e);
+	b = ns83820_mii_read_reg(dev, 1, 0x1d);
+	dprintk("version: 0x%04x 0x%04x\n", a, b);
 }
 #endif
 
-- 
2.20.1
