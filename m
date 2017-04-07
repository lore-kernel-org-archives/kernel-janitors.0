From: Colin King <colin.king@canonical.com>
Date: Fri, 07 Apr 2017 23:22:03 +0000
Subject: [PATCH] ubifs: fix cut and paste error on sb type comparisons
Message-Id: <20170407232203.9100-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for the bad node type of sb->type is checking sa->type
and not sb-type. This looks like a cut and paste error. Fix this.

Detected by PVS-Studio, warning: V581

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ubifs/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1e712a364680..cb687733136d 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2387,8 +2387,8 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 			ubifs_dump_node(c, sa->node);
 			return -EINVAL;
 		}
-		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
-		    sa->type != UBIFS_XENT_NODE) {
+		if (sb->type != UBIFS_INO_NODE && sb->type != UBIFS_DENT_NODE &&
+		    sb->type != UBIFS_XENT_NODE) {
 			ubifs_err(c, "bad node type %d", sb->type);
 			ubifs_dump_node(c, sb->node);
 			return -EINVAL;
-- 
2.11.0

