From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:26 +0000
Subject: [KJ] [Patch 5/9] BUG_ON() Conversion in md/dm-target.c
Message-Id: <1138233626.7232.42.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55594817905037885=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55594817905037885==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/dm-target.c.orig	2006-01-26 00:38:46.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/dm-target.c	2006-01-26 00:39:13.000000000 +0100
@@ -78,8 +78,7 @@ void dm_put_target_type(struct target_ty
 	if (--ti->use == 0)
 		module_put(ti->tt.module);
 
-	if (ti->use < 0)
-		BUG();
+	BUG_ON(ti->use < 0);
 	up_read(&_lock);
 
 	return;



--===============55594817905037885==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55594817905037885==--
