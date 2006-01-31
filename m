From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:13 +0000
Subject: [KJ] [Patch 3/7] BUG_ON() Conversion in mm/mempool.c
Message-Id: <1138712593.11570.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70758831184413573=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70758831184413573==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/mempool.c.orig	2006-01-30 23:15:07.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/mempool.c	2006-01-30 23:15:35.000000000 +0100
@@ -183,8 +183,8 @@ EXPORT_SYMBOL(mempool_resize);
  */
 void mempool_destroy(mempool_t *pool)
 {
-	if (pool->curr_nr != pool->min_nr)
-		BUG();		/* There were outstanding elements */
+	/* Check for outstanding elements */
+	BUG_ON(pool->curr_nr != pool->min_nr);
 	free_pool(pool);
 }
 EXPORT_SYMBOL(mempool_destroy);



--===============70758831184413573==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70758831184413573==--
