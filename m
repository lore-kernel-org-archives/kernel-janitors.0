From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 20 Sep 2005 21:09:32 +0000
Subject: Re: [KJ] [PATCH] specialix: eliminate deprecated check_region() call
Message-Id: <20050920210932.GA13136@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67544884076085299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
In-Reply-To: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============67544884076085299==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 21, 2005 at 01:04:23AM +0400, Alexey Dobriyan wrote:
> * request_region() requires release_region() on all exit paths.
> * You've changed function that "checks" to function that "requests", so
>   you have to release_region() on all exit paths after
>   sx_check_io_range().
> * After fixing previous (*), name "sx_check_io_range" is still
>   misleading. Now it requests, not checks!
> * Changing name to sx_request_io_range() doesn't work because the driver
>   already have one. ;-) BTW, request_region() in it is unchecked probably
>   due to "if check_region() said OK, request_region() can't fail".

Better just kill these useless wrapper completely.  As in the example
patch below: ;-)


Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: linux-2.6/drivers/char/specialix.c
===================================================================
--- linux-2.6.orig/drivers/char/specialix.c	2005-08-11 16:45:55.000000000 +0200
+++ linux-2.6/drivers/char/specialix.c	2005-09-20 23:08:08.000000000 +0200
@@ -333,32 +333,6 @@
 	printk(KERN_ERR "sx%d: Timeout waiting for CCR.\n", board_No(bp));
 }
 
-
-/*
- *  specialix IO8+ IO range functions.
- */
-
-static inline int sx_check_io_range(struct specialix_board * bp)
-{
-	return check_region (bp->base, SX_IO_SPACE);
-}
-
-
-static inline void sx_request_io_range(struct specialix_board * bp)
-{
-	request_region(bp->base, 
-	               bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE,
-	               "specialix IO8+" );
-}
-
-
-static inline void sx_release_io_range(struct specialix_board * bp)
-{
-	release_region(bp->base, 
-	               bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE);
-}
-
-	
 /* Must be called with enabled interrupts */
 /* Ugly. Very ugly. Don't use this for anything else than initialization 
    code */
@@ -492,13 +466,13 @@
 #endif
 	int rev;
 	int chip;
+	int error = -ENODEV;
 
 	func_enter();
 
-	if (sx_check_io_range(bp)) {
-		func_exit();
-		return 1;
-	}
+	if (!request_region(bp->base, (bp->flags & SX_BOARD_IS_PCI) ?
+			SX_PCI_IO_SPACE : SX_IO_SPACE, "specialix IO8+"))
+		goto out;
 
 	/* Are the I/O ports here ? */
 	sx_out_off(bp, CD186x_PPRL, 0x5a);
@@ -509,12 +483,10 @@
 	short_pause ();
 	val2 = sx_in_off(bp, CD186x_PPRL);
 
-	
 	if ((val1 != 0x5a) || (val2 != 0xa5)) {
 		printk(KERN_INFO "sx%d: specialix IO8+ Board at 0x%03x not found.\n",
 		       board_No(bp), bp->base);
-		func_exit();
-		return 1;
+		goto out_release_region;
 	}
 
 	/* Check the DSR lines that Specialix uses as board 
@@ -532,8 +504,7 @@
 	if (val1 != val2) {
 		printk(KERN_INFO "sx%d: specialix IO8+ ID %02x at 0x%03x not found (%02x).\n",
 		       board_No(bp), val2, bp->base, val1);
-		func_exit();
-		return 1;
+		goto out_release_region;
 	}
 
 
@@ -569,8 +540,7 @@
 	if (irqs <= 0) {
 		printk(KERN_ERR "sx%d: Can't find IRQ for specialix IO8+ board at 0x%03x.\n",
 		       board_No(bp), bp->base);
-		func_exit();
-		return 1;
+		goto out_release_region;
 	}
 #endif
 	printk (KERN_INFO "Started with irq=%d, but now have irq=%d.\n", bp->irq, irqs);
@@ -579,11 +549,11 @@
 #endif
 	/* Reset CD186x again  */
 	if (!sx_init_CD186x(bp)) {
-		func_exit();
-		return -EIO;
+		error = -EIO;
+		goto out_release_region;
 	}
 
-	sx_request_io_range(bp);
+
 	bp->flags |= SX_BOARD_PRESENT;
 	
 	/* Chip           revcode   pkgtype
@@ -621,6 +591,13 @@
 
 	func_exit();
 	return 0;
+
+ out_release_region:
+	release_region(bp->base, (bp->flags & SX_BOARD_IS_PCI) ?
+			SX_PCI_IO_SPACE : SX_IO_SPACE);
+ out:
+	func_exit();
+	return error;
 }
 
 /* 
@@ -2591,9 +2568,15 @@
 	func_enter();
 
 	sx_release_drivers();
-	for (i = 0; i < SX_NBOARD; i++)
-		if (sx_board[i].flags & SX_BOARD_PRESENT) 
-			sx_release_io_range(&sx_board[i]);
+	for (i = 0; i < SX_NBOARD; i++) {
+		struct specialix_board *bp = &sx_board[i];
+
+		if (bp->flags & SX_BOARD_PRESENT) {
+			release_region(bp->base, (bp->flags & SX_BOARD_IS_PCI) ?
+					SX_PCI_IO_SPACE : SX_IO_SPACE);
+		}
+	}
+
 #ifdef SPECIALIX_TIMER
 	del_timer (&missed_irq_timer);
 #endif

--===============67544884076085299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67544884076085299==--
