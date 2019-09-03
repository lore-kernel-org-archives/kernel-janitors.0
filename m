From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 12:11:14 +0000
Subject: [PATCH] befs: Delete an unnecessary check before brelse()
Message-Id: <83cda9b2-a2c9-2201-48b7-3bf2273d7e87@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 14:04:05 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/befs/btree.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/befs/btree.c b/fs/befs/btree.c
index 1b7e0f7128d6..a293e9ce1410 100644
--- a/fs/befs/btree.c
+++ b/fs/befs/btree.c
@@ -194,10 +194,7 @@ befs_bt_read_node(struct super_block *sb, const befs_data_stream *ds,
 	uint off = 0;

 	befs_debug(sb, "---> %s", __func__);
-
-	if (node->bh)
-		brelse(node->bh);
-
+	brelse(node->bh);
 	node->bh = befs_read_datastream(sb, ds, node_off, &off);
 	if (!node->bh) {
 		befs_error(sb, "%s failed to read "
--
2.23.0
