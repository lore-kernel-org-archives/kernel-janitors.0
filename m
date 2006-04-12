From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 12 Apr 2006 14:58:32 +0000
Subject: [KJ] [Patch] cleanup inode->r_dev usage in
Message-Id: <1144853912.7840.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3227546176051419=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1144790741.13849.2.camel@alice>
In-Reply-To: <1144790741.13849.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============3227546176051419==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

imajor()/iminor() should be used instead of accessing r_dev
directly. This patch cleans up drivers/block/aoe/aoechr.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1-git5/drivers/block/aoe/aoechr.c.orig	2006-04-12 13:50:00.000000000 +0200
+++ linux-2.6.17-rc1-git5/drivers/block/aoe/aoechr.c	2006-04-12 13:50:11.000000000 +0200
@@ -162,7 +162,7 @@ aoechr_open(struct inode *inode, struct 
 {
 	int n, i;
 
-	n = MINOR(inode->i_rdev);
+	n = iminor(inode);
 	filp->private_data = (void *) (unsigned long) n;
 
 	for (i = 0; i < ARRAY_SIZE(chardevs); ++i)



--===============3227546176051419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3227546176051419==--
