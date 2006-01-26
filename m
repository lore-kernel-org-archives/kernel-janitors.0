From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:49 +0000
Subject: [KJ] [Patch 9/9] BUG_ON() Conversion in md/raid10.c
Message-Id: <1138233649.7232.46.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15601442963535228=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15601442963535228==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/raid10.c.orig	2006-01-26 00:33:04.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/raid10.c	2006-01-26 00:33:31.000000000 +0100
@@ -1115,8 +1115,7 @@ static int end_sync_read(struct bio *bio
 	for (i=0; i<conf->copies; i++)
 		if (r10_bio->devs[i].bio == bio)
 			break;
-	if (i == conf->copies)
-		BUG();
+	BUG_ON(i == conf->copies);
 	update_head_pos(i, r10_bio);
 	d = r10_bio->devs[i].devnum;
 
@@ -1516,8 +1515,7 @@ static int init_resync(conf_t *conf)
 	int buffs;
 
 	buffs = RESYNC_WINDOW / RESYNC_BLOCK_SIZE;
-	if (conf->r10buf_pool)
-		BUG();
+	BUG_ON(conf->r10buf_pool);
 	conf->r10buf_pool = mempool_create(buffs, r10buf_pool_alloc, r10buf_pool_free, conf);
 	if (!conf->r10buf_pool)
 		return -ENOMEM;



--===============15601442963535228==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15601442963535228==--
