From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Sun, 24 Jun 2012 09:30:35 +0000
Subject: [PATCH] vfs: Release semaphore before returning in lock_mount().
Message-Id: <1340529515-23436-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

There is a missing "up_write()" here. Semaphore should be released
before returning.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
Destination tree "linux-next"

 fs/namespace.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 8f412ab..d5173df 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1473,8 +1473,10 @@ retry:
 	}
 	down_write(&namespace_sem);
 	mnt = lookup_mnt(path);
-	if (likely(!mnt))
+	if (likely(!mnt)) {
+		up_write(&namespace_sem);
 		return 0;
+	}
 	up_write(&namespace_sem);
 	mutex_unlock(&path->dentry->d_inode->i_mutex);
 	path_put(path);
-- 
1.7.4.4

