From: ChenGang <cg.chen@huawei.com>
Date: Sat, 27 Apr 2019 13:13:24 +0000
Subject: [PATCH 2/3] fs: ocfs: fix spelling mistake "hearbeat" -> "heartbeat"
Message-Id: <1556370804-119280-1-git-send-email-cg.chen@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark@fasheh.com, jlbec@evilplan.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ocfs2-devel@oss.oracle.com, ChenGang <cg.chen@huawei.com>

There is a spelling mistake in comment, fix it.

Signed-off-by: ChenGang <cg.chen@huawei.com>
---
 fs/ocfs2/cluster/quorum.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/cluster/quorum.c b/fs/ocfs2/cluster/quorum.c
index af2e747..792132f 100644
--- a/fs/ocfs2/cluster/quorum.c
+++ b/fs/ocfs2/cluster/quorum.c
@@ -89,7 +89,7 @@ static void o2quo_fence_self(void)
 	};
 }
 
-/* Indicate that a timeout occurred on a hearbeat region write. The
+/* Indicate that a timeout occurred on a heartbeat region write. The
  * other nodes in the cluster may consider us dead at that time so we
  * want to "fence" ourselves so that we don't scribble on the disk
  * after they think they've recovered us. This can't solve all
-- 
1.8.5.6
