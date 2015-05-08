From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:56 +0000
Subject: [PATCH v2 4/8] staging: lustre: remove LNetSetAsync - dead code
Message-Id: <1431086460-22455-12-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

LNetSetAsync() returns 0, and is never called.  Doesn't exist in the Intel
tree, either.  Remove it.
---
 drivers/staging/lustre/include/linux/lnet/api.h |    1 -
 drivers/staging/lustre/lnet/lnet/lib-move.c     |   24 -----------------------
 2 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/lustre/include/linux/lnet/api.h b/drivers/staging/lustre/include/linux/lnet/api.h
index cd86517..c4dc1b2 100644
--- a/drivers/staging/lustre/include/linux/lnet/api.h
+++ b/drivers/staging/lustre/include/linux/lnet/api.h
@@ -209,7 +209,6 @@ int LNetGet(lnet_nid_t	self,
 int LNetSetLazyPortal(int portal);
 int LNetClearLazyPortal(int portal);
 int LNetCtl(unsigned int cmd, void *arg);
-int LNetSetAsync(lnet_process_id_t id, int nasync);
 
 /** @} lnet_misc */
 
diff --git a/drivers/staging/lustre/lnet/lnet/lib-move.c b/drivers/staging/lustre/lnet/lnet/lib-move.c
index ba59fe7..433faae 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-move.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-move.c
@@ -2434,27 +2434,3 @@ LNetDist(lnet_nid_t dstnid, lnet_nid_t *srcnidp, __u32 *orderp)
 	return -EHOSTUNREACH;
 }
 EXPORT_SYMBOL(LNetDist);
-
-/**
- * Set the number of asynchronous messages expected from a target process.
- *
- * This function is only meaningful for userspace callers. It's a no-op when
- * called from kernel.
- *
- * Asynchronous messages are those that can come from a target when the
- * userspace process is not waiting for IO to complete; e.g., AST callbacks
- * from Lustre servers. Specifying the expected number of such messages
- * allows them to be eagerly received when user process is not running in
- * LNet; otherwise network errors may occur.
- *
- * \param id Process ID of the target process.
- * \param nasync Number of asynchronous messages expected from the target.
- *
- * \return 0 on success, and an error code otherwise.
- */
-int
-LNetSetAsync(lnet_process_id_t id, int nasync)
-{
-	return 0;
-}
-EXPORT_SYMBOL(LNetSetAsync);
-- 
1.7.1

