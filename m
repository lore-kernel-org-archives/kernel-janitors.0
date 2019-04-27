From: ChenGang <cg.chen@huawei.com>
Date: Sat, 27 Apr 2019 13:11:31 +0000
Subject: [PATCH 1/3] fs: ocfs: fix spelling mistake "hearbeat" -> "heartbeat"
Message-Id: <1556370691-119217-1-git-send-email-cg.chen@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark@fasheh.com, jlbec@evilplan.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ocfs2-devel@oss.oracle.com, ChenGang <cg.chen@huawei.com>

There is a spelling mistake in dlm_assert_master_worker comment, fix it.

Signed-off-by: ChenGang <cg.chen@huawei.com>
---
 fs/ocfs2/dlm/dlmmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 826f056..41b80d5 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -2176,7 +2176,7 @@ static void dlm_assert_master_worker(struct dlm_work_item *item, void *data)
  * think that $RECOVERY is currently mastered by a dead node.  If so,
  * we wait a short time to allow that node to get notified by its own
  * heartbeat stack, then check again.  All $RECOVERY lock resources
- * mastered by dead nodes are purged when the hearbeat callback is
+ * mastered by dead nodes are purged when the heartbeat callback is
  * fired, so we can know for sure that it is safe to continue once
  * the node returns a live node or no node.  */
 static int dlm_pre_master_reco_lockres(struct dlm_ctxt *dlm,
-- 
1.8.5.6
