From: Daniele Pizzoni <auouo@tin.it>
Date: Sun, 17 Oct 2004 16:19:11 +0000
Subject: [KJ] [PATCH 1/8] replacing/fixing printk with pr_debug/pr_info in
Message-Id: <1098032557.3023.112.camel@pdp11.tsho.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16540841561916508=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

--===============16540841561916508==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace custom macro Dprintk with pr_debug from kernel.h.
Use  pr_info when appropriate.
Fix consistency of printks.

Signed-off-by: Daniele Pizzoni <auouo@tin.it>

Index: linux-2.6.9-rc4/arch/i386/kernel/acpi/boot.c
===================================================================
--- linux-2.6.9-rc4.orig/arch/i386/kernel/acpi/boot.c	2004-10-17 16:56:59.908679824 +0200
+++ linux-2.6.9-rc4/arch/i386/kernel/acpi/boot.c	2004-10-17 17:01:22.980686800 +0200
@@ -204,7 +204,7 @@ acpi_parse_madt (
 	if (madt->lapic_address) {
 		acpi_lapic_addr = (u64) madt->lapic_address;
 
-		printk(KERN_DEBUG PREFIX "Local APIC address 0x%08x\n",
+		pr_info(PREFIX "Local APIC address 0x%08x\n",
 			madt->lapic_address);
 	}
 
@@ -461,7 +461,7 @@ unsigned int acpi_register_gsi(u32 gsi, 
 
 		if (edge_level == ACPI_LEVEL_SENSITIVE) {
 			if ((gsi < 16) && !((1 << gsi) & irq_mask)) {
-				Dprintk(KERN_DEBUG PREFIX "Setting GSI %u as level-triggered\n", gsi);
+				pr_debug(PREFIX "Setting GSI %u as level-triggered\n", gsi);
 				irq_mask |= (1 << gsi);
 				eisa_set_level_irq(gsi);
 			}
@@ -544,14 +544,14 @@ static int __init acpi_parse_hpet(unsign
         vxtime.hpet_address = hpet_tbl->addr.addrl |
                 ((long) hpet_tbl->addr.addrh << 32);
 
-        printk(KERN_INFO PREFIX "HPET id: %#x base: %#lx\n",
+        pr_info(PREFIX "HPET id: %#x base: %#lx\n",
                hpet_tbl->id, vxtime.hpet_address);
 #else	/* X86 */
 	{
 		extern unsigned long hpet_address;
 
 		hpet_address = hpet_tbl->addr.addrl;
-		printk(KERN_INFO PREFIX "HPET id: %#x base: %#lx\n",
+		pr_info(PREFIX "HPET id: %#x base: %#lx\n",
 			hpet_tbl->id, hpet_address);
 	}
 #endif	/* X86 */
@@ -594,7 +594,7 @@ static int __init acpi_parse_fadt(unsign
 		pmtmr_ioport = fadt->V1_pm_tmr_blk;
 	}
 	if (pmtmr_ioport)
-		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x\n", pmtmr_ioport);
+		pr_info(PREFIX "PM-Timer IO Port: %#x\n", pmtmr_ioport);
 #endif
 	return 0;
 }
@@ -692,7 +692,7 @@ acpi_parse_madt_ioapic_entries(void)
  	 * if "noapic" boot option, don't look for IO-APICs
 	 */
 	if (skip_ioapic_setup) {
-		printk(KERN_INFO PREFIX "Skipping IOAPIC probe "
+		pr_info(PREFIX "Skipping IOAPIC probe "
 			"due to 'noapic' option.\n");
 		return -ENODEV;
 	}



--===============16540841561916508==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16540841561916508==--
