From: John Pittman <jpittman@redhat.com>
Date: Tue, 23 Aug 2016 18:59:04 +0000
Subject: [PATCH] Include: block: blk_types: Removed unneeded union from bio struct
Message-Id: <1471978744-6632-1-git-send-email-jpittman@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@fb.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jpittman@redhat.com

In include/linux/blk_types.h a nameless, single member
union exists within the bio struct.  It seems to be left
over from earlier, edited patches added in 3.18.  Cleaned
up by removing the union and the tab given to its contents.

Signed-off-by: John Pittman <jpittman@redhat.com>
---
 include/linux/blk_types.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 436f43f..972ace4 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -61,11 +61,10 @@ struct bio {
 	struct io_context	*bi_ioc;
 	struct cgroup_subsys_state *bi_css;
 #endif
-	union {
+
 #if defined(CONFIG_BLK_DEV_INTEGRITY)
-		struct bio_integrity_payload *bi_integrity; /* data integrity */
+	struct bio_integrity_payload *bi_integrity; /* data integrity */
 #endif
-	};
 
 	unsigned short		bi_vcnt;	/* how many bio_vec's */
 
-- 
2.5.5

