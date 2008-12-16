From: "Adam Spotton" <aspotton@gmail.com>
Date: Tue, 16 Dec 2008 01:41:55 +0000
Subject: [PATCH 1/1] net: e100: add KERN_ERR constant to printk function call
Message-Id: <d2ea0b810812151741l466e1dc1ia1da597913ee0656@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add KERN_ERR constant to printk function call.

Signed-off-by: Adam Spotton <aspotton@gmail.com>
---

diff --git a/drivers/net/e100.c b/drivers/net/e100.c
index e8bfcce..26d9c3d 100644
--- a/drivers/net/e100.c
+++ b/drivers/net/e100.c
@@ -909,7 +909,7 @@ static u16 mdio_ctrl(struct nic *nic, u32 addr,
u32 dir, u32 reg, u16 data)
 		udelay(20);
 	}
 	if (unlikely(!i)) {
-		printk("e100.mdio_ctrl(%s) won't go Ready\n",
+		printk(KERN_ERR "e100.mdio_ctrl(%s) won't go Ready\n",
 			nic->netdev->name );
 		spin_unlock_irqrestore(&nic->mdio_lock, flags);
 		return 0;		/* No way to indicate timeout error */
