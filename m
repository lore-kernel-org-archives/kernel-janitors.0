From: Brandon Niemczyk <brandon@snprogramming.com>
Date: Mon, 11 Jul 2005 11:24:39 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <1121081079.3453.44.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4362259410002034=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============4362259410002034==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2005-07-11 at 11:53 +0200, walter harms wrote:
> hi Brandon,
> keep it simple


this better?

Signed-off-by: Brandon Niemczyk <brandon@snprogramming.com>

--- p1/drivers/acpi/toshiba_acpi.c.orig	2005-07-11 07:14:14.000000000 -0400
+++ p1/drivers/acpi/toshiba_acpi.c	2005-06-17 15:48:29.000000000 -0400
@@ -252,24 +252,26 @@ dispatch_read(char* page, char** start, 
 }
 
 static int
-dispatch_write(struct file* file, const char __user * buffer,
-	unsigned long count, ProcItem* item)
+dispatch_write(struct file *file, const char __user * buffer,
+	       unsigned long count, ProcItem * item)
 {
 	int result;
-	char* tmp_buffer;
+	char *tmp_buffer;
 
-	/* Arg buffer points to userspace memory, which can't be accessed
-	 * directly.  Since we're making a copy, zero-terminate the
-	 * destination so that sscanf can be used on it safely.
-	 */
 	tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
+	if (!tmp_buffer)
+		return -ENOMEM;
+
 	if (copy_from_user(tmp_buffer, buffer, count)) {
 		result = -EFAULT;
+		goto out;
 	}
-	else {
-		tmp_buffer[count] = 0;
-		result = item->write_func(tmp_buffer, count);
-	}
+
+	/* make sure sscanf can be used safely */
+	tmp_buffer[count] = 0;
+	result = item->write_func(tmp_buffer, count);
+
+out:
 	kfree(tmp_buffer);
 	return result;
 }



> tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
> if (!tmp_buffer)
> 	return -ENOMEM;
> 
> if ( copy_from_user(tmp_buffer, buffer, count) )
> 	result = -EFAULT;
> 
> tmp_buffer[count] = 0;
> result = item->write_func(tmp_buffer, count);
> 
> 
> just for the paranoid:
>   should tmp_buffer be filled with \0 to avoid an information leak ?
>   (schroedinger bug ?)

Not sure.
-- 
Brandon Niemczyk


--===============4362259410002034==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4362259410002034==--
