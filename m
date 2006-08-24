From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 24 Aug 2006 21:49:51 +0000
Subject: [KJ] [PATCH 2/2] asus_acpi: don't printk on writing garbage to proc
Message-Id: <20060824214951.GB5204@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

* This reporting is useless (you get errno anyway).
* This reporting is already inconsistent in driver.
* Looks like created files in proc are rw-rw-rw- by default.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/acpi/asus_acpi.c |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

--- a/drivers/acpi/asus_acpi.c
+++ b/drivers/acpi/asus_acpi.c
@@ -617,9 +617,7 @@ proc_write_ledd(struct file *file, const
 			       "Asus ACPI: LED display write failed\n");
 		else
 			hotk->ledd_status = (u32) value;
-	} else if (rv < 0)
-		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
-
+	}
 	return rv;
 }
 
@@ -837,10 +835,7 @@ proc_write_brn(struct file *file, const 
 		value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
 		/* 0 <= value <= 15 */
 		set_brightness(value);
-	} else if (rv < 0) {
-		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 	}
-
 	return rv;
 }
 
@@ -885,9 +880,6 @@ proc_write_disp(struct file *file, const
 	rv = parse_arg(buffer, count, &value);
 	if (rv > 0)
 		set_display(value);
-	else if (rv < 0)
-		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
-
 	return rv;
 }
 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
