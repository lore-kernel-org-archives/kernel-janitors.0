From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 Oct 2012 04:46:02 +0000
Subject: [patch] clocksource: clean up parse_pmtmr()
Message-Id: <20121020034948.GV5685@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <johnstul@us.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

I changed the strict_strtoul() to kstrtouint().  That has the check
for UINT_MAX built in to it so the ifdefs can be removed.  Also
I changed a printk() to pr_info().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clocksource/acpi_pm.c b/drivers/clocksource/acpi_pm.c
index 6b5cf02..5d1b926 100644
--- a/drivers/clocksource/acpi_pm.c
+++ b/drivers/clocksource/acpi_pm.c
@@ -233,16 +233,15 @@ fs_initcall(init_acpi_pm_clocksource);
  */
 static int __init parse_pmtmr(char *arg)
 {
-	unsigned long base;
+	unsigned int base;
+	int ret;
 
-	if (strict_strtoul(arg, 16, &base))
-		return -EINVAL;
-#ifdef CONFIG_X86_64
-	if (base > UINT_MAX)
-		return -ERANGE;
-#endif
-	printk(KERN_INFO "PMTMR IOPort override: 0x%04x -> 0x%04lx\n",
-	       pmtmr_ioport, base);
+	ret = kstrtouint(arg, 16, &base);
+	if (ret)
+		return ret;
+
+	pr_info("PMTMR IOPort override: 0x%04x -> 0x%04x\n", pmtmr_ioport,
+		base);
 	pmtmr_ioport = base;
 
 	return 1;
