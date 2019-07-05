From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 11:05:43 +0000
Subject: [PATCH][V2] ubifs: remove redundant assignment to pointer fname
Message-Id: <20190705110543.31428-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer fname is being assigned with a value that is never
read because the function returns after the assignment. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix up commit message

---
 fs/ubifs/debug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 92fe5c5ed78a..95da71e13fc8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
 		     c->vi.ubi_num, c->vi.vol_id);
 	if (n = UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
-		fname = UBIFS_DFS_DIR_NAME;
 		return;
 	}
 
-- 
2.20.1
