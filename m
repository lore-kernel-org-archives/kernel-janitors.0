From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 11:44:03 +0000
Subject: [PATCH][udf-next] udf: don't call mark_buffer_dirty on a null bh pointer
Message-Id: <20190219114403.24771-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a null check on the pointer bh to avoid a null pointer dereference
on bh->b_data however later bh is passed to mark_buffer_dirty that can also
cause a null pointer dereference on bh.  Avoid this potential null pointer
dereference by moving the call to mark_buffer_dirty inside the null checked
block.

Fixes: e8b4274735e4 ("udf: finalize integrity descriptor before writeback")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/udf/super.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index a6940d90bedd..b7e9a83d39db 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -2336,13 +2336,13 @@ static int udf_sync_fs(struct super_block *sb, int wait)
 
 			lvid = (struct logicalVolIntegrityDesc *)bh->b_data;
 			udf_finalize_lvid(lvid);
-		}
 
-		/*
-		 * Blockdevice will be synced later so we don't have to submit
-		 * the buffer for IO
-		 */
-		mark_buffer_dirty(bh);
+			/*
+			 * Blockdevice will be synced later so we don't have
+			 * to submit the buffer for IO
+			 */
+			mark_buffer_dirty(bh);
+		}
 		sbi->s_lvid_dirty = 0;
 	}
 	mutex_unlock(&sbi->s_alloc_mutex);
-- 
2.20.1
