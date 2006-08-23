From: ville palo <ville.palo@vi64pa.net>
Date: Wed, 23 Aug 2006 18:48:15 +0000
Subject: [KJ] [PATCH] Fixed couple of unreachable code segments asus_acpi.c
Message-Id: <1156358895.5368.13.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Fixed couple of unreachable code segments:

Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/acpi/asus_acpi.c b/drivers/acpi/asus_acpi.c
index e9ee4c5..c1f2356 100644
--- a/drivers/acpi/asus_acpi.c
+++ b/drivers/acpi/asus_acpi.c
@@ -608,19 +608,20 @@ proc_write_ledd(struct file *file, const
 		unsigned long count, void *data)
 {
 	int value;
-
-	count = parse_arg(buffer, count, &value);
-	if (count > 0) {
+	int result;
+	
+	result = parse_arg(buffer, count, &value);
+	if (result > 0) {
 		if (!write_acpi_int
 		    (hotk->handle, hotk->methods->mt_ledd, value, NULL))
 			printk(KERN_WARNING
 			       "Asus ACPI: LED display write failed\n");
 		else
 			hotk->ledd_status = (u32) value;
-	} else if (count < 0)
+	} else if (result < 0)
 		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 
-	return count;
+	return result;
 }
 
 /*
@@ -831,17 +832,18 @@ proc_write_brn(struct file *file, const 
 	       unsigned long count, void *data)
 {
 	int value;
+	int result;
 
-	count = parse_arg(buffer, count, &value);
-	if (count > 0) {
+	result = parse_arg(buffer, count, &value);
+	if (result > 0) {
 		value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
 		/* 0 <= value <= 15 */
 		set_brightness(value);
-	} else if (count < 0) {
+	} else if (result < 0) {
 		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 	}
 
-	return count;
+	return result;
 }
 
 static void set_display(int value)
@@ -881,14 +883,15 @@ proc_write_disp(struct file *file, const
 		unsigned long count, void *data)
 {
 	int value;
+	int result;
 
-	count = parse_arg(buffer, count, &value);
-	if (count > 0)
+	result = parse_arg(buffer, count, &value);
+	if (result > 0)
 		set_display(value);
-	else if (count < 0)
+	else if (result < 0)
 		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 
-	return count;
+	return result;
 }
 
 typedef int (proc_readfunc) (char *page, char **start, off_t off, int count,


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
