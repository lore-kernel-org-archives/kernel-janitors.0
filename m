From: Daniele Venzano <venza@brownhat.org>
Date: Thu, 22 Jan 2009 13:04:27 +0000
Subject: [PATCH] Add missing ifdef in x86 setup.c
Message-Id: <20090122130427.GA15214@milesteg.arr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

The following patch removes a warning generated when the x86
architecture is compitled without CONFIG_X86_RESERVE_LOW_64K.
The warning was: ‘dmi_low_memory_corruption’ defined but not used

Patch is against 2.6.28.1

Signed-off-by: Daniele Venzano <venza@brownhat.org>

--- a/arch/x86/kernel/setup.c	2009-01-22 13:57:16.000000000 +0100
+++ b/arch/x86/kernel/setup.c	2009-01-22 13:57:39.000000000 +0100
@@ -738,6 +738,7 @@ void start_periodic_check_for_corruption
 }
 #endif
 
+#ifdef CONFIG_X86_RESERVE_LOW_64K
 static int __init dmi_low_memory_corruption(const struct dmi_system_id *d)
 {
 	printk(KERN_NOTICE
@@ -749,6 +750,7 @@ static int __init dmi_low_memory_corrupt
 
 	return 0;
 }
+#endif
 
 /* List of systems that have known low memory corruption BIOS problems */
 static struct dmi_system_id __initdata bad_bios_dmi_table[] = {

