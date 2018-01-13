From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 15:46:28 +0000
Subject: [PATCH] ocfs2: Combine two seq_printf() calls into one call in ocfs2_dlm_seq_show()
Message-Id: <441d5e20-ea32-cfe8-bb1e-794d94c85be7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ocfs2-devel@oss.oracle.com, Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mfasheh@versity.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 16:36:51 +0100

Some data were printed into a sequence by two separate function calls.
Print almost the same data by a single function call instead.
(Omit a tab character at the line end within a format string.)

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ocfs2/dlmglue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index e4b9085a657a..909b4a339c80 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -3104,7 +3104,7 @@ static int ocfs2_dlm_seq_show(struct seq_file *m, void *v)
 		   "%llu\t"
 		   "%u\t"
 		   "%u\t"
-		   "%u\t",
+		   "%u\n",
 		   lock_num_prmode(lockres),
 		   lock_num_exmode(lockres),
 		   lock_num_prmode_failed(lockres),
@@ -3114,9 +3114,6 @@ static int ocfs2_dlm_seq_show(struct seq_file *m, void *v)
 		   lock_max_prmode(lockres),
 		   lock_max_exmode(lockres),
 		   lock_refresh(lockres));
-
-	/* End the line */
-	seq_printf(m, "\n");
 	return 0;
 }
 
-- 
2.15.1

