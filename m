From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 10:42:15 +0000
Subject: [PATCH] devcoredump: remove redundant assignment to iter
Message-Id: <20171107104215.10748-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to pointer iter is redundant as this is also performed
in the following macro for_each_sg, hence it can be removed. Cleans
up clang warning:

./include/linux/devcoredump.h:45:2: warning: Value stored to 'iter'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/linux/devcoredump.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index 269521f143ac..a9f3e2480739 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -42,7 +42,6 @@ static inline void _devcd_free_sgtable(struct scatterlist *table)
 	struct scatterlist *delete_iter;
 
 	/* free pages */
-	iter = table;
 	for_each_sg(table, iter, sg_nents(table), i) {
 		page = sg_page(iter);
 		if (page)
-- 
2.14.1

