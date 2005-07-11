From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Mon, 11 Jul 2005 22:32:12 +0000
Subject: [KJ] [PATCH] cli() cleanup in xircom_tulip_cp.c and fec.c
Message-Id: <1121121132.3554.50.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25733685345778223=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25733685345778223==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

replaces calls to save_flags(); cli() with spinlocks, also fixes some unreadable spacing
in outl_CSR6()

Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>

diff -pruNX anti-cli/Documentation/dontdiff linux-pristine/drivers/net/fec.c anti-cli/drivers/net/fec.c
--- linux-pristine/drivers/net/fec.c	2005-06-17 15:48:29.000000000 -0400
+++ anti-cli/drivers/net/fec.c	2005-07-11 01:35:34.000000000 -0400
@@ -707,6 +707,7 @@ mii_queue(struct net_device *dev, int re
 	unsigned long	flags;
 	mii_list_t	*mip;
 	int		retval;
+	static spinlock_t lock = SPIN_LOCK_UNLOCKED;
 
 	/* Add PHY address to register command.
 	*/
@@ -715,8 +716,7 @@ mii_queue(struct net_device *dev, int re
 
 	retval = 0;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&lock, flags);
 
 	if ((mip = mii_free) != NULL) {
 		mii_free = mip->mii_next;
@@ -736,7 +736,7 @@ mii_queue(struct net_device *dev, int re
 		retval = 1;
 	}
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&lock, flags);
 
 	return(retval);
 }
diff -pruNX anti-cli/Documentation/dontdiff linux-pristine/drivers/net/tulip/xircom_tulip_cb.c anti-cli/drivers/net/tulip/xircom_tulip_cb.c
--- linux-pristine/drivers/net/tulip/xircom_tulip_cb.c	2005-07-10 23:42:14.000000000 -0400
+++ anti-cli/drivers/net/tulip/xircom_tulip_cb.c	2005-07-11 18:22:58.000000000 -0400
@@ -358,46 +358,49 @@ static struct ethtool_ops ops;
 static void outl_CSR6(u32 newcsr6, long ioaddr)
 {
 	const int strict_bits =
-		TxThresh10 | TxStoreForw | TxThreshMask | EnableTxRx | FullDuplexBit;
-    int csr5, csr5_22_20, csr5_19_17, currcsr6, attempts = 200;
-    unsigned long flags;
-    save_flags(flags);
-    cli();
+	    TxThresh10 | TxStoreForw | TxThreshMask | EnableTxRx |
+	    FullDuplexBit;
+	int csr5, csr5_22_20, csr5_19_17, currcsr6, attempts = 200;
+	unsigned long flags;
+	static spinlock_t lock = SPIN_LOCK_UNLOCKED;
+
+	spin_lock_irqsave(&lock, flags);
 	/* mask out the reserved bits that always read 0 on the Xircom cards */
 	newcsr6 &= ~ReservedZeroMask;
 	/* or in the reserved bits that always read 1 */
 	newcsr6 |= ReservedOneMask;
-    currcsr6 = inl(ioaddr + CSR6);
-    if (((newcsr6 & strict_bits) == (currcsr6 & strict_bits)) ||
-	((currcsr6 & ~EnableTxRx) == 0)) {
+	currcsr6 = inl(ioaddr + CSR6);
+	if (((newcsr6 & strict_bits) == (currcsr6 & strict_bits)) ||
+	    ((currcsr6 & ~EnableTxRx) == 0)) {
 		outl(newcsr6, ioaddr + CSR6);	/* safe */
-		restore_flags(flags);
-		return;
-    }
-    /* make sure the transmitter and receiver are stopped first */
-    currcsr6 &= ~EnableTxRx;
-    while (1) {
+		goto fini;
+	}
+	/* make sure the transmitter and receiver are stopped first */
+	currcsr6 &= ~EnableTxRx;
+	while (1) {
 		csr5 = inl(ioaddr + CSR5);
 		if (csr5 == 0xffffffff)
-			break;  /* cannot read csr5, card removed? */
+			break;	/* cannot read csr5, card removed? */
 		csr5_22_20 = csr5 & 0x700000;
 		csr5_19_17 = csr5 & 0x0e0000;
 		if ((csr5_22_20 == 0 || csr5_22_20 == 0x600000) &&
-			(csr5_19_17 == 0 || csr5_19_17 == 0x80000 || csr5_19_17 == 0xc0000))
-			break;  /* both are stopped or suspended */
+		    (csr5_19_17 == 0 || csr5_19_17 == 0x80000
+		     || csr5_19_17 == 0xc0000))
+			break;	/* both are stopped or suspended */
 		if (!--attempts) {
-			printk(KERN_INFO DRV_NAME ": outl_CSR6 too many attempts,"
-				   "csr5=0x%08x\n", csr5);
-			outl(newcsr6, ioaddr + CSR6);  /* unsafe but do it anyway */
-			restore_flags(flags);
-			return;
+			printk(KERN_INFO DRV_NAME
+			       ": outl_CSR6 too many attempts," "csr5=0x%08x\n",
+			       csr5);
+			outl(newcsr6, ioaddr + CSR6);	/* unsafe but do it anyway */
+			goto fini;
 		}
 		outl(currcsr6, ioaddr + CSR6);
 		udelay(1);
-    }
-    /* now it is safe to change csr6 */
-    outl(newcsr6, ioaddr + CSR6);
-    restore_flags(flags);
+	}
+	/* now it is safe to change csr6 */
+	outl(newcsr6, ioaddr + CSR6);
+fini:
+	spin_unlock_irqrestore(&lock, flags);
 }
 
 
@@ -1463,6 +1466,7 @@ static int xircom_ioctl(struct net_devic
 	u16 *data = (u16 *)&rq->ifr_ifru;
 	int phy = tp->phys[0] & 0x1f;
 	unsigned long flags;
+	static spinlock_t lock = SPIN_LOCK_UNLOCKED;
 
 	switch(cmd) {
 	/* Legacy mii-diag interface */
@@ -1473,16 +1477,14 @@ static int xircom_ioctl(struct net_devic
 			return -ENODEV;
 		return 0;
 	case SIOCGMIIREG:		/* Read MII PHY register. */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&lock, flags);
 		data[3] = mdio_read(dev, data[0] & 0x1f, data[1] & 0x1f);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&lock, flags);
 		return 0;
 	case SIOCSMIIREG:		/* Write MII PHY register. */
 		if (!capable(CAP_NET_ADMIN))
 			return -EPERM;
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&lock, flags);
 		if (data[0] == tp->phys[0]) {
 			u16 value = data[2];
 			switch (data[1]) {
@@ -1502,7 +1504,7 @@ static int xircom_ioctl(struct net_devic
 			check_duplex(dev);
 		}
 		mdio_write(dev, data[0] & 0x1f, data[1] & 0x1f, data[2]);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&lock, flags);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -1609,8 +1611,9 @@ static void set_rx_mode(struct net_devic
 		unsigned long flags;
 		unsigned int entry;
 		int dummy = -1;
+		static spinlock_t lock = SPIN_LOCK_UNLOCKED;
 
-		save_flags(flags); cli();
+		spin_lock_irqsave(&lock, flags);
 		entry = tp->cur_tx++ % TX_RING_SIZE;
 
 		if (entry != 0) {
@@ -1637,7 +1640,7 @@ static void set_rx_mode(struct net_devic
 		}
 		if (dummy >= 0)
 			tp->tx_ring[dummy].status = Tx0DescOwned;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&lock, flags);
 		/* Trigger an immediate transmit demand. */
 		outl(0, ioaddr + CSR1);
 	}



--===============25733685345778223==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25733685345778223==--
