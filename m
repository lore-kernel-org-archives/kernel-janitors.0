From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 10:03:18 +0000
Subject: [PATCH] tc35815: fix iomap leak
Message-Id: <1278756199-4636-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Jiri Pirko <jpirko@redhat.com>, Eric Dumazet <eric.dumazet@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, netdev@vger.kernel.org

If tc35815_init_one() fails we must unmap mapped regions.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/tc35815.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/net/tc35815.c b/drivers/net/tc35815.c
index be08b75..99afa5c 100644
--- a/drivers/net/tc35815.c
+++ b/drivers/net/tc35815.c
@@ -854,7 +854,7 @@ static int __devinit tc35815_init_one(struct pci_dev *pdev,
 
 	rc = register_netdev(dev);
 	if (rc)
-		goto err_out;
+		goto err_out_iounmap;
 
 	memcpy(dev->perm_addr, dev->dev_addr, dev->addr_len);
 	printk(KERN_INFO "%s: %s at 0x%lx, %pM, IRQ %d\n",
@@ -872,6 +872,8 @@ static int __devinit tc35815_init_one(struct pci_dev *pdev,
 
 err_out_unregister:
 	unregister_netdev(dev);
+err_out_iounmap:
+	pcim_iounmap_regions(pdev, 1 << 1);
 err_out:
 	free_netdev(dev);
 	return rc;
-- 
1.7.0.4

