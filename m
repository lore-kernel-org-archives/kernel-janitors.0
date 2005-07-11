From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Mon, 11 Jul 2005 03:07:00 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <1121051220.3453.33.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15023353463143474=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============15023353463143474==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here it is with the stylistic fixes:

Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>

--- linux/drivers/acpi/toshiba_acpi.c.orig	2005-07-10 20:40:47.000000000 -0400
+++ linux/drivers/acpi/toshiba_acpi.c	2005-07-10 23:00:43.000000000 -0400
@@ -263,9 +263,11 @@ dispatch_write(struct file* file, const 
 	 * destination so that sscanf can be used on it safely.
 	 */
 	tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
-	if (copy_from_user(tmp_buffer, buffer, count)) {
+
+	if (!tmp_buffer) 
+		return -ENOMEM;
+	else if (copy_from_user(tmp_buffer, buffer, count))
 		result = -EFAULT;
-	}
 	else {
 		tmp_buffer[count] = 0;
 		result = item->write_func(tmp_buffer, count);

On Sun, 2005-07-10 at 19:32 -0700, randy_dunlap wrote:
> On Sun, 10 Jul 2005 21:20:44 -0400 Brandon Niemczyk wrote:
> <snip>
> Looks correct functionally, but needs a space after "if", like "if (".
> 
> Oh, don't use braces for one-line "blocks".
> Yes the copy_from_user() below does that too.  :(

-- 
Brandon Niemczyk


--===============15023353463143474==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15023353463143474==--
