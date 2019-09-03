From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 13:20:42 +0000
Subject: [PATCH] gfs2: Delete an unnecessary check before brelse()
Message-Id: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <563A6A22.5000206@users.sourceforge.net>
In-Reply-To: <563A6A22.5000206@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 15:10:05 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/gfs2/dir.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 6f35d19eec25..eb9c0578978f 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -1463,8 +1463,7 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
 				sort_offset : entries, copied);
 out_free:
 	for(i = 0; i < leaf; i++)
-		if (larr[i])
-			brelse(larr[i]);
+		brelse(larr[i]);
 	kvfree(larr);
 out:
 	return error;
--
2.23.0
