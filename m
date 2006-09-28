From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 28 Sep 2006 13:09:42 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for drivers/pcmcia
Message-Id: <1159448262.7264.26.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only) to make sure the files are compiling without
any warning/error due to new changes

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
Please CC me. I'm not on linux-pcmcia
---
 at91_cf.c        |    3 ++-
 au1000_generic.c |   10 ++++++++++
 m8xx_pcmcia.c    |   12 ++++++++----
 omap_cf.c        |    3 ++-
 4 files changed, 22 insertions(+), 6 deletions(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/pcmcia/at91_cf.c linux-2.6.18/drivers/pcmcia/at91_cf.c
--- linux-2.6.18-orig/drivers/pcmcia/at91_cf.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/pcmcia/at91_cf.c	2006-09-28 17:30:13.000000000 +0530
@@ -316,9 +316,10 @@ static int __init at91_cf_probe(struct p
 	return 0;
 
 fail2:
-	iounmap((void __iomem *) cf->socket.io_offset);
 	release_mem_region(io->start, io->end + 1 - io->start);
 fail1:
+	if (cf->socket.io_offset)
+		iounmap((void __iomem *) cf->socket.io_offset);
 	if (board->irq_pin)
 		free_irq(board->irq_pin, cf);
 fail0a:
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/pcmcia/au1000_generic.c linux-2.6.18/drivers/pcmcia/au1000_generic.c
--- linux-2.6.18-orig/drivers/pcmcia/au1000_generic.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/pcmcia/au1000_generic.c	2006-09-28 17:45:42.000000000 +0530
@@ -445,6 +445,16 @@ int au1x00_pcmcia_socket_probe(struct de
 		pcmcia_unregister_socket(&skt->socket);
 out_err:
 		flush_scheduled_work();
+		if (i = 0) {
+			iounmap(skt->virt_io + (u32)mips_io_port_base);
+			skt->virt_io = NULL;
+		} 
+#ifndef CONFIG_MIPS_XXS1500
+		else {
+			iounmap(skt->virt_io + (u32)mips_io_port_base);
+			skt->virt_io = NULL;
+		}
+#endif
 		ops->hw_shutdown(skt);
 
 		i--;
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/pcmcia/m8xx_pcmcia.c linux-2.6.18/drivers/pcmcia/m8xx_pcmcia.c
--- linux-2.6.18-orig/drivers/pcmcia/m8xx_pcmcia.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/pcmcia/m8xx_pcmcia.c	2006-09-28 17:51:19.000000000 +0530
@@ -427,7 +427,7 @@ static int voltage_set(int slot, int vcc
 			reg |= BCSR1_PCCVCC1;
 			break;
 		default:
-			return 1;
+			goto out_unmap;
 	}
 
 	switch(vpp) {
@@ -438,15 +438,15 @@ static int voltage_set(int slot, int vcc
 			if(vcc = vpp)
 				reg |= BCSR1_PCCVPP1;
 			else
-				return 1;
+				goto out_unmap;
 			break;
 		case 120:
 			if ((vcc = 33) || (vcc = 50))
 				reg |= BCSR1_PCCVPP0;
 			else
-				return 1;
+				goto out_unmap;
 		default:
-			return 1;
+			goto out_unmap;
 	}
 
 	/* first, turn off all power */
@@ -457,6 +457,10 @@ static int voltage_set(int slot, int vcc
 
 	iounmap(bcsr_io);
 	return 0;
+
+out_unmap:
+	iounmap(bcsr_io);
+	return 1;
 }
 
 #define socket_get(_slot_) PCMCIA_SOCKET_KEY_5V
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/pcmcia/omap_cf.c linux-2.6.18/drivers/pcmcia/omap_cf.c
--- linux-2.6.18-orig/drivers/pcmcia/omap_cf.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/pcmcia/omap_cf.c	2006-09-28 17:52:58.000000000 +0530
@@ -306,9 +306,10 @@ static int __init omap_cf_probe(struct d
 	return 0;
 
 fail2:
-	iounmap((void __iomem *) cf->socket.io_offset);
 	release_mem_region(cf->phys_cf, SZ_8K);
 fail1:
+	if (cf->socket.io_offset)
+		iounmap((void __iomem *) cf->socket.io_offset);
 	free_irq(irq, cf);
 fail0:
 	kfree(cf);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
