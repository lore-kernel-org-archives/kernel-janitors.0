From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 11:25:49 +0000
Subject: [PATCH] reiserfs: fix spelling mistake "enrty" -> "entry"
Message-Id: <20190416112549.25175-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/reiserfs/lbalance.c | 2 +-
 fs/reiserfs/namei.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index f5cebd70d903..e7cebd05a882 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -1164,7 +1164,7 @@ void leaf_cut_from_buffer(struct buffer_info *bi, int cut_item_num,
 		if (pos_in_item = 0) {
 			/* change key */
 			RFALSE(cut_item_num,
-			       "when 0-th enrty of item is cut, that item must be first in the node, not %d-th",
+			       "when 0-th entry of item is cut, that item must be first in the node, not %d-th",
 			       cut_item_num);
 			/* change item key by key of first entry in the item */
 			set_le_ih_k_offset(ih, deh_offset(B_I_DEH(bh, ih)));
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 97f3fc4fdd79..c97c36b4a31c 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -536,7 +536,7 @@ static int reiserfs_add_entry(struct reiserfs_transaction_handle *th,
 		pathrelse(&path);
 		return -EBUSY;
 	}
-	/* adjust offset of directory enrty */
+	/* adjust offset of directory entry */
 	put_deh_offset(deh, SET_GENERATION_NUMBER(deh_offset(deh), gen_number));
 	set_cpu_key_k_offset(&entry_key, deh_offset(deh));
 
-- 
2.20.1
