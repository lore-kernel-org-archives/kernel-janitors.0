From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 25 Jan 2006 23:59:58 +0000
Subject: [KJ] [Patch 1/9] BUG_ON() Conversion in md/bitmap.c
Message-Id: <1138233598.7232.35.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54415094160752386=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54415094160752386==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/bitmap.c.orig	2006-01-26 00:26:28.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/bitmap.c	2006-01-26 00:26:51.000000000 +0100
@@ -1309,7 +1309,7 @@ int bitmap_startwrite(struct bitmap *bit
 		case 1:
 			*bmc = 2;
 		}
-		if ((*bmc & COUNTER_MAX) == COUNTER_MAX) BUG();
+		BUG_ON((*bmc & COUNTER_MAX) == COUNTER_MAX);
 		(*bmc)++;
 
 		spin_unlock_irq(&bitmap->lock);



--===============54415094160752386==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54415094160752386==--
