From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jun 2020 15:54:41 +0000
Subject: [PATCH][next] blk-cgroup: clean up indentation
Message-Id: <20200630155441.518850-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Jens Axboe <axboe@kernel.dk>, cgroups@vger.kernel.org, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too deeply, fix it
by removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 block/blk-cgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 1ce94afc03bc..748c4b2a9273 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1837,7 +1837,7 @@ void blk_cgroup_bio_start(struct bio *bio)
 	 */
 	if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
 		bio_set_flag(bio, BIO_CGROUP_ACCT);
-			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
+		bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
 	}
 	bis->cur.ios[rwd]++;
 
-- 
2.27.0
