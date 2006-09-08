From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:07 +0000
Subject: [KJ] [PATCH 51/72] arm: add KERN_ constants to
Message-Id: <20060908020207.10114.73005.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-sa1100/collie_pm.c b/arch/arm/mach-sa1100/collie_pm.c
index 1e25b1d..b3d088d 100644
--- a/arch/arm/mach-sa1100/collie_pm.c
+++ b/arch/arm/mach-sa1100/collie_pm.c
@@ -49,13 +49,13 @@ static void collie_charger_init(void)
 	/* Register interrupt handler. */
 	if ((err = request_irq(COLLIE_IRQ_GPIO_AC_IN, sharpsl_ac_isr, IRQF_DISABLED,
 			       "ACIN", sharpsl_ac_isr))) {
-		printk("Could not get irq %d.\n", COLLIE_IRQ_GPIO_AC_IN);
+		printk(KERN_ERR "Could not get irq %d.\n", COLLIE_IRQ_GPIO_AC_IN);
 		return;
 	}
 	if ((err = request_irq(COLLIE_IRQ_GPIO_CO, sharpsl_chrg_full_isr, IRQF_DISABLED,
 			       "CO", sharpsl_chrg_full_isr))) {
 		free_irq(COLLIE_IRQ_GPIO_AC_IN, sharpsl_ac_isr);
-		printk("Could not get irq %d.\n", COLLIE_IRQ_GPIO_CO);
+		printk(KERN_ERR "Could not get irq %d.\n", COLLIE_IRQ_GPIO_CO);
 		return;
 	}
 
@@ -125,7 +125,7 @@ int collie_read_backup_battery(void)
 	ucb1x00_io_write(ucb, 0, COLLIE_TC35143_GPIO_BBAT_ON);
 	ucb1x00_adc_disable(ucb);
 
-	printk("Backup battery = %d(%d)\n", ADCtoPower(voltage), voltage);
+	pr_info("Backup battery = %d(%d)\n", ADCtoPower(voltage), voltage);
 
 	return ADCtoPower(voltage);
 }
@@ -147,7 +147,7 @@ int collie_read_main_battery(void)
 	voltage_rev = voltage + ((ad_revise * voltage) / 652);
 	voltage_volts = ADCtoPower(voltage_rev);
 
-	printk("Main battery = %d(%d)\n", voltage_volts, voltage);
+	pr_info("Main battery = %d(%d)\n", voltage_volts, voltage);
 
 	if (voltage != -1)
 		return voltage_volts;
@@ -170,7 +170,7 @@ int collie_read_temp(void)
 	ucb1x00_io_write(ucb, 0, COLLIE_TC35143_GPIO_TMP_ON);
 	ucb1x00_adc_disable(ucb);
 
-	printk("Battery temp = %d\n", voltage);
+	pr_info("Battery temp = %d\n", voltage);
 	return voltage;
 }
 
@@ -185,12 +185,12 @@ static unsigned long read_devdata(int wh
 		return 500;
 	case SHARPSL_STATUS_ACIN: {
 		int ret = GPLR & COLLIE_GPIO_AC_IN;
-		printk("AC status = %d\n", ret);
+		pr_info("AC status = %d\n", ret);
 		return ret;
 	}
 	case SHARPSL_STATUS_FATAL: {
 		int ret = GPLR & COLLIE_GPIO_MAIN_BAT_LOW;
-		printk("Fatal bat = %d\n", ret);
+		pr_info("Fatal bat = %d\n", ret);
 		return ret;
 	}
 	default:
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
