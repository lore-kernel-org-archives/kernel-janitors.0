From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 18:57:48 +0000
Subject: [PATCH] ocfs2: fix spelling mistake: "ambigous" -> "ambiguous"
Message-Id: <20180427185748.16618-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in mlog_bug_on_msg message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index ddc3e9470c87..18d4aa8eace6 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -548,7 +548,7 @@ static int ocfs2_read_locked_inode(struct inode *inode,
 	 */
 	mlog_bug_on_msg(!!(fe->i_flags & cpu_to_le32(OCFS2_SYSTEM_FL)) ! 			!!(args->fi_flags & OCFS2_FI_FLAG_SYSFILE),
-			"Inode %llu: system file state is ambigous\n",
+			"Inode %llu: system file state is ambiguous\n",
 			(unsigned long long)args->fi_blkno);
 
 	if (S_ISCHR(le16_to_cpu(fe->i_mode)) ||
-- 
2.17.0

