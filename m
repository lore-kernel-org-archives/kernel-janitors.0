From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 21 Feb 2006 21:32:29 +0000
Subject: [KJ] [Patch] kzalloc conversion in kernel/kexec.c
Message-Id: <1140557549.26219.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59402256047478641=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59402256047478641==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts kernel/kexec.c to kzalloc() usage.
A similar patch was send to lkml 9.Nov 2005 by 
Panagiotis Issaris <takis@issaris.org> but seems to got lost.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/kernel/kexec.c.orig	2006-02-21 22:25:35.000000000 +0100
+++ linux-2.6.16-rc4/kernel/kexec.c	2006-02-21 22:25:59.000000000 +0100
@@ -108,11 +108,10 @@ static int do_kimage_alloc(struct kimage
 
 	/* Allocate a controlling structure */
 	result = -ENOMEM;
-	image = kmalloc(sizeof(*image), GFP_KERNEL);
+	image = kzalloc(sizeof(*image), GFP_KERNEL);
 	if (!image)
 		goto out;
 
-	memset(image, 0, sizeof(*image));
 	image->head = 0;
 	image->entry = &image->head;
 	image->last_entry = &image->head;



--===============59402256047478641==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59402256047478641==--
