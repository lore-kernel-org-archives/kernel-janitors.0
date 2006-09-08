From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:59 +0000
Subject: [KJ] [PATCH 23/72] arm: add KERN_ constants to
Message-Id: <20060908015859.10114.89104.sendpatchset@david.homenet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0262610617=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0262610617==

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index 3ea140b..8a1b017 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -5,7 +5,7 @@
  *
  * Copyright (C) 2004 Nokia Corporation
  * Written by Tony Lindgren <tony@atomide.com>
- * Major cleanups by Juha Yrj���l��� <juha.yrjola@nokia.com>
+ * Major cleanups by Juha Yrj������������������<juha.yrjola@nokia.com>
  *
  * Completely re-written to support various OMAP chips with bank specific
  * interrupt handlers.
@@ -202,7 +202,7 @@ #if defined(CONFIG_ARCH_OMAP16XX)
 		irq_bank_count = ARRAY_SIZE(omap1610_irq_banks);
 	}
 #endif
-	printk("Total of %i interrupts in %i interrupt banks\n",
+	pr_info("Total of %i interrupts in %i interrupt banks\n",
 	       irq_bank_count * 32, irq_bank_count);
 
 	/* Mask and clear all interrupts */

--===============0262610617==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0262610617==--
