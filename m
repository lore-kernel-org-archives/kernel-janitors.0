From: Jimmy Pan <dspjm1@gmail.com>
Date: Tue, 25 Oct 2011 08:18:47 +0000
Subject: [PATCH 3.0]isdn add audit to request_region
Message-Id: <CAAgJb5vScDn0j4aTr498OWGr31bjGwLofyfaaAXzshXf8O68_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add three audit for request_region() function.
Mere newbie here, I don't know if my style of posting and developing is correct.
If anything I've done wrong, please correct me.

--- linux-3.0_build/drivers/isdn/sc/init.c	2011-07-22 10:17:23.000000000 +0800
+++ linux-3.0/drivers/isdn/sc/init.c	2011-10-25 14:22:14.475039218 +0800
@@ -349,19 +349,22 @@ static int __init sc_init(void)
 		sc_adapter[cinst]->iobase = io[b];
 		for(i = 0 ; i < MAX_IO_REGS - 1 ; i++) {
 			sc_adapter[cinst]->ioport[i] = io[b] + i * 0x400;
-			request_region(sc_adapter[cinst]->ioport[i], 1,
-					interface->id);
+			if (!request_region(sc_adapter[cinst]->ioport[i], 1,
+					    interface->id))
+				pr_debug("request_region failed\n");
 			pr_debug("Requesting I/O Port %#x\n",
 				sc_adapter[cinst]->ioport[i]);
 		}
 		sc_adapter[cinst]->ioport[IRQ_SELECT] = io[b] + 0x2;
-		request_region(sc_adapter[cinst]->ioport[IRQ_SELECT], 1,
-				interface->id);
+		if (!request_region(sc_adapter[cinst]->ioport[IRQ_SELECT], 1,
+				    interface->id))
+			pr_debug("request_region failed\n");
 		pr_debug("Requesting I/O Port %#x\n",
 				sc_adapter[cinst]->ioport[IRQ_SELECT]);
 		sc_adapter[cinst]->rambase = ram[b];
-		request_region(sc_adapter[cinst]->rambase, SRAM_PAGESIZE,
-				interface->id);
+		if (!request_region(sc_adapter[cinst]->rambase, SRAM_PAGESIZE,
+				    interface->id))
+			pr_debug("request_region failed\n");

 		pr_info("  %s (%d) - %s %d channels IRQ %d, I/O Base 0x%x, RAM Base
0x%lx\n",
 			sc_adapter[cinst]->devicename,
