From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 12 Apr 2006 14:58:35 +0000
Subject: [KJ] [Patch] cleanup inode->r_dev usage in drivers/block/loop.c
Message-Id: <1144853915.7840.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69617273473971397=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1144790741.13849.2.camel@alice>
In-Reply-To: <1144790741.13849.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============69617273473971397==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

imajor()/iminor() should be used instead of accessing r_dev
directly. This patch cleans up drivers/block/loop.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1-git5/drivers/block/loop.c.orig	2006-04-12 13:50:23.000000000 +0200
+++ linux-2.6.17-rc1-git5/drivers/block/loop.c	2006-04-12 13:50:46.000000000 +0200
@@ -734,7 +734,7 @@ static inline int is_loop_device(struct 
 {
 	struct inode *i = file->f_mapping->host;
 
-	return i && S_ISBLK(i->i_mode) && MAJOR(i->i_rdev) == LOOP_MAJOR;
+	return i && S_ISBLK(i->i_mode) && imajor(i) == LOOP_MAJOR;
 }
 
 static int loop_set_fd(struct loop_device *lo, struct file *lo_file,



--===============69617273473971397==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69617273473971397==--
