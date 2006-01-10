From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:41:10 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/ecard.c
Message-Id: <20060110114110.GC8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76466587707952938=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76466587707952938==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.15/arch/arm/kernel/ecard.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/ecard.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/ecard.c	2006-01-07 11:06:16.000000000 +0100
@@ -509,13 +509,13 @@
 {
 	ecard_t *ec;
 
-	printk("Expansion card IRQ state:\n");
+	printk(KERN_DEBUG "Expansion card IRQ state:\n");
 
 	for (ec = cards; ec; ec = ec->next) {
 		if (ec->slot_no == 8)
 			continue;
 
-		printk("  %d: %sclaimed, ",
+		printk(KERN_DEBUG "  %d: %sclaimed, ",
 		       ec->slot_no, ec->claimed ? "" : "not ");
 
 		if (ec->ops && ec->ops->irqpending &&
@@ -1068,7 +1068,7 @@
 		return ret;
 	}
 
-	printk("Probing expansion cards\n");
+	printk(KERN_INFO "Probing expansion cards\n");
 
 	for (slot = 0; slot < 8; slot ++) {
 		if (ecard_probe(slot, ECARD_EASI) == -ENODEV)

--===============76466587707952938==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76466587707952938==--
