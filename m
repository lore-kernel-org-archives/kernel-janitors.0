From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Fri, 26 Jul 2013 13:59:14 +0000
Subject: [PATCH v2] nilfs2: remove double bio_put() in nilfs_end_bio_write() for BIO_EOPNOTSUPP error
Message-Id: <1374847154.3671.70.camel@slavad-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: KONISHI Ryusuke <konishi.ryusuke@lab.ntt.co.jp>
Cc: DanCarpenter <dan.carpenter@oracle.com>, linux-nilfs <linux-nilfs@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi Ryusuke,

I changed place of increment operation of segbuf->sb_nbio in
nilfs_segbuf_submit_bio() and adding decrement operation for
BIO_EOPNOTSUPP case in second version of the patch.

Could you share your opinion about this version of the patch?

With the best regards,
Vyacheslav Dubeyko.
---
From: Vyacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v2] nilfs2: remove double bio_put() in nilfs_end_bio_write() for BIO_EOPNOTSUPP error

This patch removes double call of bio_put() in nilfs_end_bio_write()
for the case of BIO_EOPNOTSUPP error detection. The issue was found
by Dan Carpenter and he suggests first version of the fix too.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vyacheslav Dubeyko <slava@dubeyko.com>
CC: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
---
 fs/nilfs2/segbuf.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index dc9a913..0b09ec9 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -345,8 +345,7 @@ static void nilfs_end_bio_write(struct bio *bio, int err)
 
 	if (err = -EOPNOTSUPP) {
 		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
-		bio_put(bio);
-		/* to be detected by submit_seg_bio() */
+		/* to be detected by nilfs_segbuf_submit_bio() */
 	}
 
 	if (!uptodate)
@@ -377,12 +376,13 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 	bio->bi_private = segbuf;
 	bio_get(bio);
 	submit_bio(mode, bio);
+	segbuf->sb_nbio++;
 	if (bio_flagged(bio, BIO_EOPNOTSUPP)) {
+		segbuf->sb_nbio--;
 		bio_put(bio);
 		err = -EOPNOTSUPP;
 		goto failed;
 	}
-	segbuf->sb_nbio++;
 	bio_put(bio);
 
 	wi->bio = NULL;
-- 
1.7.9.5



