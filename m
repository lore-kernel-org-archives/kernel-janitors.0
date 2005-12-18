From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:56:20 +0000
Subject: [KJ] [Patch 5/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134946580.7394.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32366845611190498=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32366845611190498==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this removes LINUX_VERSION_CODE checks in tokenring/lanstreamer.c

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/tokenring/lanstreamer.c.orig	2005-12-18 23:49:59.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/tokenring/lanstreamer.c	2005-12-18 23:50:22.000000000 +0100
@@ -1932,64 +1932,6 @@ static int sprintf_info(char *buffer, st
 #endif
 #endif
 
-#if STREAMER_IOCTL && (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
-static int streamer_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-        int i;
-	struct streamer_private *streamer_priv = (struct streamer_private *) dev->priv;
-	u8 __iomem *streamer_mmio = streamer_priv->streamer_mmio;
-
-	switch(cmd) {
-	case IOCTL_SISR_MASK:
-		writew(SISR_MI, streamer_mmio + SISR_MASK_SUM);
-		break;
-	case IOCTL_SPIN_LOCK_TEST:
-	        printk(KERN_INFO "spin_lock() called.\n");
-		spin_lock(&streamer_priv->streamer_lock);
-		spin_unlock(&streamer_priv->streamer_lock);
-		printk(KERN_INFO "spin_unlock() finished.\n");
-		break;
-	case IOCTL_PRINT_BDAS:
-	        printk(KERN_INFO "bdas: RXBDA: %x RXLBDA: %x TX2FDA: %x TX2LFDA: %x\n",
-		       readw(streamer_mmio + RXBDA),
-		       readw(streamer_mmio + RXLBDA),
-		       readw(streamer_mmio + TX2FDA),
-		       readw(streamer_mmio + TX2LFDA));
-		break;
-	case IOCTL_PRINT_REGISTERS:
-	        printk(KERN_INFO "registers:\n");
-		printk(KERN_INFO "SISR: %04x MISR: %04x LISR: %04x BCTL: %04x BMCTL: %04x\nmask  %04x mask  %04x\n", 
-		       readw(streamer_mmio + SISR),
-		       readw(streamer_mmio + MISR_RUM),
-		       readw(streamer_mmio + LISR),
-		       readw(streamer_mmio + BCTL),
-		       readw(streamer_mmio + BMCTL_SUM),
-		       readw(streamer_mmio + SISR_MASK),
-		       readw(streamer_mmio + MISR_MASK));
-		break;
-	case IOCTL_PRINT_RX_BUFS:
-	        printk(KERN_INFO "Print rx bufs:\n");
-		for(i=0; i<STREAMER_RX_RING_SIZE; i++)
-		        printk(KERN_INFO "rx_ring %d status: 0x%x\n", i, 
-			       streamer_priv->streamer_rx_ring[i].status);
-		break;
-	case IOCTL_PRINT_TX_BUFS:
-	        printk(KERN_INFO "Print tx bufs:\n");
-		for(i=0; i<STREAMER_TX_RING_SIZE; i++)
-		        printk(KERN_INFO "tx_ring %d status: 0x%x\n", i, 
-			       streamer_priv->streamer_tx_ring[i].status);
-		break;
-	case IOCTL_RX_CMD:
-	        streamer_rx(dev);
-		printk(KERN_INFO "Sent rx command.\n");
-		break;
-	default:
-	        printk(KERN_INFO "Bad ioctl!\n");
-	}
-	return 0;
-}
-#endif
-
 static struct pci_driver streamer_pci_driver = {
   .name     = "lanstreamer",
   .id_table = streamer_pci_tbl,



--===============32366845611190498==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32366845611190498==--
