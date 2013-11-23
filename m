From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 23 Nov 2013 17:13:10 +0000
Subject: [PATCH] dcache: update a comment to reflect the code
Message-Id: <1385226790-29092-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Serge Hallyn <serge.hallyn@canonical.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The following commit introduced the function shrink_submounts_and_drop
which replaces the function check_submounts_and_drop.
This patch updates a comment to use the new function name.

commit 40216baa0101ec7ac9ce7c4f4f4d684f3a85eb93
Author: Eric W. Biederman <ebiederman@twitter.com>
Date:   Tue Oct 1 18:33:48 2013 -0700

    vfs: Lazily remove mounts on unlinked files and directories. v2

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 fs/dcache.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 9042a32..1c0576e 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1204,8 +1204,8 @@ EXPORT_SYMBOL(have_submounts);
  * reachable (e.g. NFS can unhash a directory dentry and then the complete
  * subtree can become unreachable).
  *
- * Only one of check_submounts_and_drop() and d_set_mounted() must succeed.  For
- * this reason take rename_lock and d_lock on dentry and ancestors.
+ * Only one of shrink_submounts_and_drop() and d_set_mounted() must succeed.
+ * For this reason take rename_lock and d_lock on dentry and ancestors.
  */
 int d_set_mounted(struct dentry *dentry)
 {
-- 
1.7.10.4

