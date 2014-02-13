From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Feb 2014 11:19:53 +0000
Subject: [patch] jbd2: use after free in jbd2_journal_start_reserved()
Message-Id: <20140213111953.GC15549@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

If start_this_handle() fails then it leads to a use after free of
"handle".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index 8360674c85bc..60bb365f54a5 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -514,11 +514,13 @@ int jbd2_journal_start_reserved(handle_t *handle, unsigned int type,
 	 * similarly constrained call sites
 	 */
 	ret = start_this_handle(journal, handle, GFP_NOFS);
-	if (ret < 0)
+	if (ret < 0) {
 		jbd2_journal_free_reserved(handle);
+		return ret;
+	}
 	handle->h_type = type;
 	handle->h_line_no = line_no;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(jbd2_journal_start_reserved);
 
