From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Mon, 11 Jul 2005 01:20:44 +0000
Subject: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <1121044844.3554.25.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58545338520034473=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58545338520034473==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>

--- linux/drivers/acpi/toshiba_acpi.c.orig	2005-07-10 20:40:47.000000000 -0400
+++ linux/drivers/acpi/toshiba_acpi.c	2005-07-10 20:42:33.000000000 -0400
@@ -263,7 +263,10 @@ dispatch_write(struct file* file, const 
 	 * destination so that sscanf can be used on it safely.
 	 */
 	tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
-	if (copy_from_user(tmp_buffer, buffer, count)) {
+
+	if(!tmp_buffer) {
+		return -ENOMEM;
+	} else if (copy_from_user(tmp_buffer, buffer, count)) {
 		result = -EFAULT;
 	}
 	else {




--===============58545338520034473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58545338520034473==--
