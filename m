From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Tue, 28 May 2013 07:31:15 +0000
Subject: [PATCH] md: bcache: io.c: fix a potential NULL pointer dereference
Message-Id: <1369726275-5424-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: koverstreet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: neilb-l3A5Bk7waGM@public.gmane.org, linux-bcache-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-raid-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

bio_alloc_bioset returns NULL on failure. This fix adds a missing check
for potential NULL pointer dereferencing.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/md/bcache/io.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/bcache/io.c b/drivers/md/bcache/io.c
index 29f344b..4be2a07 100644
--- a/drivers/md/bcache/io.c
+++ b/drivers/md/bcache/io.c
@@ -98,6 +98,8 @@ struct bio *bch_bio_split(struct bio *bio, int sectors,
 
 	if (bio->bi_rw & REQ_DISCARD) {
 		ret = bio_alloc_bioset(gfp, 1, bs);
+		if (!ret)
+			return NULL;
 		idx = 0;
 		goto out;
 	}
-- 
1.7.10.4

