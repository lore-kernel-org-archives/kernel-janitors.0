From: Eric Sesterhenn <eric_s@gmx.de>
Date: Thu, 26 Jan 2006 00:00:15 +0000
Subject: [KJ] [Patch 3/9] BUG_ON() Conversion in md/dm-path-selector.c
Message-Id: <1138233615.7232.38.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99767853962318176=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99767853962318176==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/dm-path-selector.c.orig	2006-01-26 00:37:43.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/dm-path-selector.c	2006-01-26 00:37:52.000000000 +0100
@@ -86,8 +86,7 @@ void dm_put_path_selector(struct path_se
 	if (--psi->use == 0)
 		module_put(psi->pst.module);
 
-	if (psi->use < 0)
-		BUG();
+	BUG_ON(psi->use < 0);
 
 out:
 	up_read(&_ps_lock);



--===============99767853962318176==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99767853962318176==--
