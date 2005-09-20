From: Jesse Millan <jesse.millan@gmail.com>
Date: Tue, 20 Sep 2005 23:31:49 +0000
Subject: [KJ] [PATCH] [RESEND] specialix: eliminate deprecated
Message-Id: <156C652F-0E4F-4BFF-9BAD-24126542EFB1@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-2-775537508"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-2-775537508
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


This patch eliminates deprecated check_region() call and all *_region  
wrapper functions.

*note: After looking at the module and Christioph's patch for awhile  
I've decided to take another stab at it. I believe its almost  
equivalent to Christoph's except its missing the goto statements and  
the local variable 'bp' in the modules exit function.

Thanks for the comments so far :-)


--Apple-Mail-2-775537508
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="deprecated_check_region_specialix.patch"
Content-Disposition: attachment;
	filename=deprecated_check_region_specialix.patch

Eliminate deprecated check_region() call and *_region wrapper functions.
Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/char/specialix.c |   35 +++++++----------------------------
 1 files changed, 7 insertions(+), 28 deletions(-)

diff -puN drivers/char/specialix.c~deprecated_check_region_specialix drivers/char/specialix.c
--- linux-2.6.14-rc1/drivers/char/specialix.c~deprecated_check_region_specialix	2005-09-20 14:27:41.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/char/specialix.c	2005-09-20 16:23:19.000000000 -0700
@@ -334,31 +334,6 @@ static inline void sx_wait_CCR_off(struc
 }
 
 
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
@@ -495,7 +470,8 @@ static int sx_probe(struct specialix_boa
 
 	func_enter();
 
-	if (sx_check_io_range(bp)) {
+	if(! request_region(bp->base, bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE, "specialix IO8+")) {
+		/* region not available */
 		func_exit();
 		return 1;
 	}
@@ -513,6 +489,7 @@ static int sx_probe(struct specialix_boa
 	if ((val1 != 0x5a) || (val2 != 0xa5)) {
 		printk(KERN_INFO "sx%d: specialix IO8+ Board at 0x%03x not found.\n",
 		       board_No(bp), bp->base);
+		release_region(bp->base, bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE);
 		func_exit();
 		return 1;
 	}
@@ -532,6 +509,7 @@ static int sx_probe(struct specialix_boa
 	if (val1 != val2) {
 		printk(KERN_INFO "sx%d: specialix IO8+ ID %02x at 0x%03x not found (%02x).\n",
 		       board_No(bp), val2, bp->base, val1);
+		release_region(bp->base, bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE);
 		func_exit();
 		return 1;
 	}
@@ -569,6 +547,7 @@ static int sx_probe(struct specialix_boa
 	if (irqs <= 0) {
 		printk(KERN_ERR "sx%d: Can't find IRQ for specialix IO8+ board at 0x%03x.\n",
 		       board_No(bp), bp->base);
+		/* Update: should release_region() here */
 		func_exit();
 		return 1;
 	}
@@ -579,11 +558,11 @@ static int sx_probe(struct specialix_boa
 #endif
 	/* Reset CD186x again  */
 	if (!sx_init_CD186x(bp)) {
+		release_region(bp->base, bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE);
 		func_exit();
 		return -EIO;
 	}
 
-	sx_request_io_range(bp);
 	bp->flags |= SX_BOARD_PRESENT;
 	
 	/* Chip           revcode   pkgtype
@@ -2593,7 +2572,7 @@ static void __exit specialix_exit_module
 	sx_release_drivers();
 	for (i = 0; i < SX_NBOARD; i++)
 		if (sx_board[i].flags & SX_BOARD_PRESENT) 
-			sx_release_io_range(&sx_board[i]);
+			release_region(sx_board[i].base, sx_board[i].flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE);
 #ifdef SPECIALIX_TIMER
 	del_timer (&missed_irq_timer);
 #endif
_

--Apple-Mail-2-775537508
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-2-775537508--
