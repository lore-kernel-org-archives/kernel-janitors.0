From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:52 +0000
Subject: [KJ] [PATCH][RESUBMIT][8/21] drivers/isdn/sc/* - compile warning
Message-Id: <42113C2C.9954.52BD55@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44728286053505917=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============44728286053505917==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - cast integer arguments to proper 
pointer types.  

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/sc/init.c linux-2.6.11-rc3-mm2/drivers/isdn/sc/init.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/sc/init.c	2005-02-12 12:06:24.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/sc/init.c	2005-02-12 17:01:02.000000000 +0200
@@ -502,7 +502,7 @@ int identify_board(unsigned long rambase
 	 */
 	outb(PRI_BASEPG_VAL, pgport);
 	msleep_interruptible(1000);
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
 		return PRI_BOARD;
@@ -512,7 +512,7 @@ int identify_board(unsigned long rambase
 	 */
 	outb(BRI_BASEPG_VAL, pgport);
 	msleep_interruptible(1000);
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
 		return BRI_BOARD;
@@ -522,7 +522,7 @@ int identify_board(unsigned long rambase
 	/*
 	 * Try to spot a card
 	 */
-	sig = readl(rambase + SIG_OFFSET);
+	sig = readl((volatile void __iomem *)(rambase + SIG_OFFSET));
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig != SIGNATURE)
 		return -1;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/isdn/sc/shmem.c linux-2.6.11-rc3-mm2/drivers/isdn/sc/shmem.c
--- linux-2.6.11-rc3-mm2-original/drivers/isdn/sc/shmem.c	2004-12-24 23:34:30.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/isdn/sc/shmem.c	2005-02-12 17:01:02.000000000 +0200
@@ -56,8 +56,8 @@ void memcpy_toshmem(int card, void *dest
 
 	outb(((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE) >> 14) | 0x80,
 		sc_adapter[card]->ioport[sc_adapter[card]->shmem_pgport]);
-	memcpy_toio(sc_adapter[card]->rambase +
-		((unsigned long) dest % 0x4000), src, n);
+	memcpy_toio((volatile void __iomem *)(sc_adapter[card]->rambase +
+		((unsigned long) dest % 0x4000)), src, n);
 	spin_unlock_irqrestore(&sc_adapter[card]->lock, flags);
 	pr_debug("%s: set page to %#x\n",sc_adapter[card]->devicename,
 		((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE)>>14)|0x80);
@@ -135,8 +135,8 @@ void memset_shmem(int card, void *dest, 
 
 	outb(((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE) >> 14) | 0x80,
 		sc_adapter[card]->ioport[sc_adapter[card]->shmem_pgport]);
-	memset_io(sc_adapter[card]->rambase +
-		((unsigned long) dest % 0x4000), c, n);
+	memset_io((volatile void __iomem *)(sc_adapter[card]->rambase +
+		((unsigned long) dest % 0x4000)), c, n);
 	pr_debug("%s: set page to %#x\n",sc_adapter[card]->devicename,
 		((sc_adapter[card]->shmem_magic + ch * SRAM_PAGESIZE)>>14)|0x80);
 	spin_unlock_irqrestore(&sc_adapter[card]->lock, flags);




--===============44728286053505917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44728286053505917==--
