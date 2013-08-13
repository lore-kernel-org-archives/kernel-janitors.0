From: Vyacheslav Dubeyko <slava@dubeyko.com>
Date: Tue, 13 Aug 2013 13:50:51 +0000
Subject: [PATCH v3 2/2] nilfs2: fix issue with counting number of bio requests for BIO_EOPNOTSUPP error detec
Message-Id: <1376401851.2274.10.camel@slavad-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Cc: DanCarpenter <dan.carpenter@oracle.com>, linux-nilfs@vger.kernel.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org

From: Vyacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v3 2/2] nilfs2: fix issue with counting number of bio requests for BIO_EOPNOTSUPP error detection

This patch fixes the issue with improper counting number of
flying bio requests for BIO_EOPNOTSUPP error detection case.

The sb_nbio must be incremented exactly the same number of times as
complete() function was called (or will be called) because
nilfs_segbuf_wait() will call wail_for_completion() for the number of
times set to sb_nbio:

do {
    wait_for_completion(&segbuf->sb_bio_event);
} while (--segbuf->sb_nbio > 0);

Two functions complete() and wait_for_completion() must be called the
same number of times for the same sb_bio_event. Otherwise,
wait_for_completion() will hang or leak.

Signed-off-by: Vyacheslav Dubeyko <slava@dubeyko.com>
CC: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
CC: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/nilfs2/segbuf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index 5bacf46..2d8be51 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -376,12 +376,12 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 	bio->bi_private = segbuf;
 	bio_get(bio);
 	submit_bio(mode, bio);
+	segbuf->sb_nbio++;
 	if (bio_flagged(bio, BIO_EOPNOTSUPP)) {
 		bio_put(bio);
 		err = -EOPNOTSUPP;
 		goto failed;
 	}
-	segbuf->sb_nbio++;
 	bio_put(bio);
 
 	wi->bio = NULL;
-- 
1.7.9.5



