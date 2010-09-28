From: Vasiliy Kulikov <segooon@gmail.com>
Date: Tue, 28 Sep 2010 17:49:35 +0000
Subject: [PATCH] staging: ft1000: fix skb, netdev, memory leaks
Message-Id: <1285696175-5654-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491590-32750-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285491590-32750-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Marek Belisko <marek.belisko@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

ft1000_copy_up_pkt() doesn't free skb on errors.
init_ft1000_card() doesn't free netdev with free_netdev() but with kfree().
init_ft1000_card() doesn't check request_region()'s return value
and doesn't free region on error.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c |   32 +++++++++++++--------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
index a6ba84c..eed7e94 100644
--- a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
+++ b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
@@ -1686,6 +1686,7 @@ int ft1000_copy_up_pkt(struct net_device *dev)
 			  tempword);
 		ft1000_flush_fifo(dev, DSP_PKTPHCKSUM_INFO);
 		info->stats.rx_errors++;
+		kfree_skb(skb);
 		return FAILURE;
 	}
 	//subtract the number of bytes read already
@@ -1711,6 +1712,7 @@ int ft1000_copy_up_pkt(struct net_device *dev)
 			*pbuffer++ = (u8) (tempword >> 8);
 			*pbuffer++ = (u8) tempword;
 			if (ft1000_chkcard(dev) = FALSE) {
+				kfree_skb(skb);
 				return FAILURE;
 			}
 		}
@@ -2236,15 +2238,17 @@ struct net_device *init_ft1000_card(unsigned short irq, int port,
 
 	if (request_irq(dev->irq, ft1000_interrupt, IRQF_SHARED, dev->name, dev)) {
 		printk(KERN_ERR "ft1000: Could not request_irq\n");
-		kfree(dev);
-		return (NULL);
+		goto err_dev;
 	}
 
-	request_region(dev->base_addr, 256, dev->name);
+	if (request_region(dev->base_addr, 256, dev->name) = NULL) {
+		printk(KERN_ERR "ft1000: Could not request_region\n");
+		goto err_irq;
+	}
 
 	if (register_netdev(dev) != 0) {
 		DEBUG(0, "ft1000: Could not register netdev");
-		return NULL;
+		goto err_reg;
 	}
 
 	info->AsicID = ft1000_read_reg(dev, FT1000_REG_ASIC_ID);
@@ -2252,19 +2256,13 @@ struct net_device *init_ft1000_card(unsigned short irq, int port,
 		DEBUG(0, "ft1000_hw: ELECTRABUZZ ASIC\n");
 		if (request_firmware(&fw_entry, "ft1000.img", fdev) != 0) {
 			printk(KERN_INFO "ft1000: Could not open ft1000.img\n");
-			unregister_netdev(dev);
-			free_irq(dev->irq, dev);
-			kfree(dev);
-			return NULL;
+			goto err_unreg;
 		}
 	} else {
 		DEBUG(0, "ft1000_hw: MAGNEMITE ASIC\n");
 		if (request_firmware(&fw_entry, "ft2000.img", fdev) != 0) {
 			printk(KERN_INFO "ft1000: Could not open ft2000.img\n");
-			unregister_netdev(dev);
-			free_irq(dev->irq, dev);
-			kfree(dev);
-			return NULL;
+			goto err_unreg;
 		}
 	}
 
@@ -2279,6 +2277,16 @@ struct net_device *init_ft1000_card(unsigned short irq, int port,
 		   dev->dev_addr[1], dev->dev_addr[2], dev->dev_addr[3],
 		   dev->dev_addr[4], dev->dev_addr[5]);
 	return dev;
+
+err_unreg:
+	unregister_netdev(dev);
+err_reg:
+	release_region(dev->base_addr, 256);
+err_irq:
+	free_irq(dev->irq, dev);
+err_dev:
+	free_netdev(dev);
+	return NULL;
 }
 
 EXPORT_SYMBOL(init_ft1000_card);
-- 
1.7.0.4

