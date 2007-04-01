From: Brendan Burns <bburns@union.edu>
Date: Sun, 01 Apr 2007 02:41:38 +0000
Subject: [KJ] [PATCH] request_region auditing
Message-Id: <1175395299.3215.10.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

from: Brendan Burns <bburns@cs.umass.edu>

Auditing request_region calls

Signed-off-by: Brendan Burns
---
--- linux-2.6.20.4/drivers/video/matrox/matroxfb_base.c.orig	2007-03-31
22:21:14.000000000 -0400
+++ linux-2.6.20.4/drivers/video/matrox/matroxfb_base.c	2007-03-31
22:21:49.000000000 -0400
@@ -1735,7 +1735,8 @@ static int initMatrox2(WPMINFO struct bo
 #endif	/* CONFIG_MTRR */
 
 	if (!ACCESS_FBINFO(devflags.novga))
-		request_region(0x3C0, 32, "matrox");
+		if (!request_region(0x3C0, 32, "matrox"))
+			return -EBUSY;
 	matroxfb_g450_connect(PMINFO2);
 	ACCESS_FBINFO(hw_switch->reset(PMINFO2));
 
--- linux-2.6.20.4/drivers/pnp/isapnp/core.c.orig	2007-03-31
22:25:57.000000000 -0400
+++ linux-2.6.20.4/drivers/pnp/isapnp/core.c	2007-03-31
22:26:29.000000000 -0400
@@ -1101,7 +1101,8 @@ static int __init isapnp_init(void)
 			printk(KERN_INFO "isapnp: No Plug & Play device found\n");
 			return 0;
 		}
-		request_region(isapnp_rdp, 1, "isapnp read");
+		if (!request_region(isapnp_rdp, 1, "isapnp read"))
+			return -EBUSY;
 	}
 	isapnp_build_device_list();
 	cards = 0;
--- linux-2.6.20.4/drivers/net/tokenring/smctr.c.orig	2007-03-31
22:28:04.000000000 -0400
+++ linux-2.6.20.4/drivers/net/tokenring/smctr.c	2007-03-31
22:28:34.000000000 -0400
@@ -508,7 +508,8 @@ static int __init smctr_chk_mca(struct n
 	r2 = mca_read_stored_pos(tp->slot_num, 2);
 	r2 &= 0xF0;
 	dev->base_addr = ((__u16)r2 << 8) + (__u16)0x800;
-	request_region(dev->base_addr, SMCTR_IO_EXTENT, smctr_name);
+	if (!request_region(dev->base_addr, SMCTR_IO_EXTENT, smctr_name))
+		return -EBUSY;
 
 	/* IRQ */
 	r5 = mca_read_stored_pos(tp->slot_num, 5);
--- linux-2.6.20.4/drivers/net/hamradio/scc.c.orig	2007-03-31
22:29:44.000000000 -0400
+++ linux-2.6.20.4/drivers/net/hamradio/scc.c	2007-03-31
22:30:44.000000000 -0400
@@ -1808,8 +1808,10 @@ static int scc_net_ioctl(struct net_devi
 
 				if (found)
 				{
-					request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl");
-					request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data");
+					if (!request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl"))
+						return -EBUSY;
+					if (!request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data"))
+						return -EBUSY;
 					if (Nchips+chan != 0 &&
 					    scc_net_alloc(device_name, 
 							  &SCC_Info[2*Nchips+chan]))
--- linux-2.6.20.4/drivers/isdn/sc/init.c.orig	2007-03-31
22:32:39.000000000 -0400
+++ linux-2.6.20.4/drivers/isdn/sc/init.c	2007-03-31 22:33:41.000000000
-0400
@@ -352,19 +352,22 @@ static int __init sc_init(void)
 		sc_adapter[cinst]->iobase = io[b];
 		for(i = 0 ; i < MAX_IO_REGS - 1 ; i++) {
 			sc_adapter[cinst]->ioport[i] = io[b] + i * 0x400;
-			request_region(sc_adapter[cinst]->ioport[i], 1,
-					interface->id);
+			if (!request_region(sc_adapter[cinst]->ioport[i], 1,
+					interface->id))
+				return -EBUSY;
 			pr_debug("Requesting I/O Port %#x\n",
 				sc_adapter[cinst]->ioport[i]);
 		}
 		sc_adapter[cinst]->ioport[IRQ_SELECT] = io[b] + 0x2;
-		request_region(sc_adapter[cinst]->ioport[IRQ_SELECT], 1,
-				interface->id);
+		if (!request_region(sc_adapter[cinst]->ioport[IRQ_SELECT], 1,
+				interface->id))
+			return -EBUSY;
 		pr_debug("Requesting I/O Port %#x\n",
 				sc_adapter[cinst]->ioport[IRQ_SELECT]);
 		sc_adapter[cinst]->rambase = ram[b];
-		request_region(sc_adapter[cinst]->rambase, SRAM_PAGESIZE,
-				interface->id);
+		if (!request_region(sc_adapter[cinst]->rambase, SRAM_PAGESIZE,
+				interface->id))
+			return -EBUSY;
 
 		pr_info("  %s (%d) - %s %d channels IRQ %d, I/O Base 0x%x, RAM Base
0x%lx\n", 
 			sc_adapter[cinst]->devicename,

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
