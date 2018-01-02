From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jan 2018 16:38:48 +0000
Subject: [PATCH][ocfs2-next] ocfs2: don't use a bool for error return from call to ocfs2_get_clusters
Message-Id: <20180102163848.15408-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a bool is being used to get and check for a -ve error
return from the call to ocfs2_get_clusters but the check for ret < 0 is
never true for a bool.  Fix this by using an int type for an error return
instead.

Detected by CoverityScan, CID#1463416 ("Operands don't affect result")

Fixes: ea6b711ecfb6 ("ocfs2-fall-back-to-buffer-io-when-append-dio-is-disabled-with-file-hole-existing-fix")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/aops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 87562112cb5e..a3be523e001c 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -2432,10 +2432,12 @@ static bool ocfs2_range_has_holes(struct inode *inode, loff_t pos, size_t count)
 	clusters = ocfs2_clusters_for_bytes(sb, pos + count) - cpos;
 
 	while (clusters) {
-		ret = ocfs2_get_clusters(inode, cpos, &phys_cpos, &extent_len,
+		int err;
+
+		err = ocfs2_get_clusters(inode, cpos, &phys_cpos, &extent_len,
 					 &extent_flags);
-		if (ret < 0) {
-			mlog_errno(ret);
+		if (err < 0) {
+			mlog_errno(err);
 			goto out;
 		}
 
-- 
2.14.1

