From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Jan 2019 17:08:17 +0000
Subject: [PATCH] wan: dscc4: fix various indentation issues
Message-Id: <20190116170817.22383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some lines that have indentation issues, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/dscc4.c | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wan/dscc4.c b/drivers/net/wan/dscc4.c
index c0b0f525c87c..d5dc823f781e 100644
--- a/drivers/net/wan/dscc4.c
+++ b/drivers/net/wan/dscc4.c
@@ -456,16 +456,16 @@ static int state_check(u32 state, struct dscc4_dev_priv *dpriv,
 	int ret = 0;
 
 	if (debug > 1) {
-	if (SOURCE_ID(state) != dpriv->dev_id) {
-		printk(KERN_DEBUG "%s (%s): Source Id=%d, state=%08x\n",
-		       dev->name, msg, SOURCE_ID(state), state );
+		if (SOURCE_ID(state) != dpriv->dev_id) {
+			printk(KERN_DEBUG "%s (%s): Source Id=%d, state=%08x\n",
+			       dev->name, msg, SOURCE_ID(state), state);
 			ret = -1;
-	}
-	if (state & 0x0df80c00) {
-		printk(KERN_DEBUG "%s (%s): state=%08x (UFO alert)\n",
-		       dev->name, msg, state);
+		}
+		if (state & 0x0df80c00) {
+			printk(KERN_DEBUG "%s (%s): state=%08x (UFO alert)\n",
+			       dev->name, msg, state);
 			ret = -1;
-	}
+		}
 	}
 	return ret;
 }
@@ -1760,25 +1760,25 @@ static void dscc4_rx_irq(struct dscc4_pci_priv *priv,
 	} else { /* SccEvt */
 		if (debug > 1) {
 			//FIXME: verifier la presence de tous les evenements
-		static struct {
-			u32 mask;
-			const char *irq_name;
-		} evts[] = {
-			{ 0x00008000, "TIN"},
-			{ 0x00000020, "RSC"},
-			{ 0x00000010, "PCE"},
-			{ 0x00000008, "PLLA"},
-			{ 0, NULL}
-		}, *evt;
-
-		for (evt = evts; evt->irq_name; evt++) {
-			if (state & evt->mask) {
+			static struct {
+				u32 mask;
+				const char *irq_name;
+			} evts[] = {
+				{ 0x00008000, "TIN"},
+				{ 0x00000020, "RSC"},
+				{ 0x00000010, "PCE"},
+				{ 0x00000008, "PLLA"},
+				{ 0, NULL}
+			}, *evt;
+
+			for (evt = evts; evt->irq_name; evt++) {
+				if (state & evt->mask) {
 					printk(KERN_DEBUG "%s: %s\n",
-						dev->name, evt->irq_name);
-				if (!(state &= ~evt->mask))
-					goto try;
+					       dev->name, evt->irq_name);
+					if (!(state &= ~evt->mask))
+						goto try;
+				}
 			}
-		}
 		} else {
 			if (!(state &= ~0x0000c03c))
 				goto try;
-- 
2.19.1
