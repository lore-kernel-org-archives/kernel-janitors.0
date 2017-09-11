From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Sep 2017 19:43:23 +0000
Subject: [PATCH] mm/backing-dev.c: fix an error handling path in 'cgwb_create()'
Message-Id: <20170911194323.17833-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: axboe@fb.com, jack@suse.cz, tj@kernel.org, geliangtang@gmail.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the 'kmalloc' fails, we must go through the existing error handling
path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 mm/backing-dev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index f028a9a472fd..e19606bb41a0 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -569,8 +569,10 @@ static int cgwb_create(struct backing_dev_info *bdi,
 
 	/* need to create a new one */
 	wb = kmalloc(sizeof(*wb), gfp);
-	if (!wb)
-		return -ENOMEM;
+	if (!wb) {
+		ret = -ENOMEM;
+		goto out_put;
+	}
 
 	ret = wb_init(wb, bdi, blkcg_css->id, gfp);
 	if (ret)
-- 
2.11.0

