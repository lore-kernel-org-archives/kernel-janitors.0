From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:30 +0000
Subject: [KJ] [Patch 6/9] BUG_ON() Conversion in md/raid1.c
Message-Id: <1138233630.7232.43.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87146680693390666=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87146680693390666==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/raid1.c.orig	2006-01-26 00:34:06.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/raid1.c	2006-01-26 00:34:27.000000000 +0100
@@ -1541,8 +1541,7 @@ static int init_resync(conf_t *conf)
 	int buffs;
 
 	buffs = RESYNC_WINDOW / RESYNC_BLOCK_SIZE;
-	if (conf->r1buf_pool)
-		BUG();
+	BUG_ON(conf->r1buf_pool);
 	conf->r1buf_pool = mempool_create(buffs, r1buf_pool_alloc, r1buf_pool_free,
 					  conf->poolinfo);
 	if (!conf->r1buf_pool)
@@ -1715,8 +1714,7 @@ static sector_t sync_request(mddev_t *md
 			    !conf->fullsync &&
 			    !test_bit(MD_RECOVERY_REQUESTED, &mddev->recovery))
 				break;
-			if (sync_blocks < (PAGE_SIZE>>9))
-				BUG();
+			BUG_ON(sync_blocks < (PAGE_SIZE>>9));
 			if (len > (sync_blocks<<9))
 				len = sync_blocks<<9;
 		}



--===============87146680693390666==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87146680693390666==--
