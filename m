From: ChenGang <cg.chen@huawei.com>
Date: Sat, 27 Apr 2019 13:13:51 +0000
Subject: [PATCH 3/3] fs: ocfs: fix spelling mistake from "hearbeating" -> "heartbeating"
Message-Id: <1556370831-119324-1-git-send-email-cg.chen@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark@fasheh.com, jlbec@evilplan.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ocfs2-devel@oss.oracle.com, ChenGang <cg.chen@huawei.com>

There is a spelling mistake in comment, fix it.

Signed-off-by: ChenGang <cg.chen@huawei.com>
---
 fs/ocfs2/cluster/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index e9f236a..7a43c04 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1776,7 +1776,7 @@ static void o2net_hb_node_up_cb(struct o2nm_node *node, int node_num,
 		(msecs_to_jiffies(o2net_reconnect_delay()) + 1);
 
 	if (node_num != o2nm_this_node()) {
-		/* believe it or not, accept and node hearbeating testing
+		/* believe it or not, accept and node heartbeating testing
 		 * can succeed for this node before we got here.. so
 		 * only use set_nn_state to clear the persistent error
 		 * if that hasn't already happened */
-- 
1.8.5.6
