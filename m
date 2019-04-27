From: ChenGang <cg.chen@huawei.com>
Date: Sat, 27 Apr 2019 12:22:35 +0000
Subject: [PATCH] fs: ocfs: fix spelling mistake "heartbeart" -> "heartbeat"
Message-Id: <1556367755-118120-1-git-send-email-cg.chen@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark@fasheh.com, jlbec@evilplan.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ocfs2-devel@oss.oracle.com, ChenGang <cg.chen@huawei.com>

There is a spelling mistake in o2hb_do_disk_heartbeat debug message.Fix it.

Signed-off-by: ChenGang <cg.chen@huawei.com>
---
 fs/ocfs2/cluster/heartbeat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index f3c20b2..e4e7df1 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -1198,7 +1198,7 @@ static int o2hb_do_disk_heartbeat(struct o2hb_region *reg)
 	if (atomic_read(&reg->hr_steady_iterations) != 0) {
 		if (atomic_dec_and_test(&reg->hr_unsteady_iterations)) {
 			printk(KERN_NOTICE "o2hb: Unable to stabilize "
-			       "heartbeart on region %s (%s)\n",
+			       "heartbeat on region %s (%s)\n",
 			       config_item_name(&reg->hr_item),
 			       reg->hr_dev_name);
 			atomic_set(&reg->hr_steady_iterations, 0);
-- 
1.8.5.6
