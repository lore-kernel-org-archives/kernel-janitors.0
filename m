From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 20 Feb 2006 12:26:16 +0000
Subject: [KJ][Patch] corrset useage of negative number in an unsigned long
Message-Id: <1140438376.7787.10.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94731086738228587=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94731086738228587==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/,

ICC complains about a "Pointless comparsion of unsigned interger with
zero" @ line 760 & 808 of asus_acpi.c

In both cases this is due to stuffing an int returned from parse_arg
into an unsigned long. However we need the negative cases so in the
patch below I have just added an extra int i, to store and use the
returned value.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- linux-2.6.16-rc3/drivers/acpi/asus_acpi.c.orig	2006-02-20 00:24:25.000000000 +1100
+++ linux-2.6.16-rc3/drivers/acpi/asus_acpi.c	2006-02-20 23:02:46.000000000 +1100
@@ -750,14 +750,14 @@ static int
 proc_write_brn(struct file *file, const char __user * buffer,
 	       unsigned long count, void *data)
 {
-	int value;
+	int value, i;
 
-	count = parse_arg(buffer, count, &value);
-	if (count > 0) {
+	i = parse_arg(buffer, count, &value);
+	if (i > 0) {
 		value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
 		/* 0 <= value <= 15 */
 		set_brightness(value);
-	} else if (count < 0) {
+	} else if (i < 0) {
 		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 	}
 
@@ -800,12 +800,12 @@ static int
 proc_write_disp(struct file *file, const char __user * buffer,
 		unsigned long count, void *data)
 {
-	int value;
+	int value,i;
 
-	count = parse_arg(buffer, count, &value);
-	if (count > 0)
+	i = parse_arg(buffer, count, &value);
+	if (i > 0)
 		set_display(value);
-	else if (count < 0)
+	else if (i < 0)
 		printk(KERN_WARNING "Asus ACPI: Error reading user input\n");
 
 	return count;




--===============94731086738228587==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94731086738228587==--
