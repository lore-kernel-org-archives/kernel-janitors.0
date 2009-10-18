From: Andreas Gruenbacher <agruen@suse.de>
Date: Sun, 18 Oct 2009 15:12:05 +0000
Subject: [PATCH] attach_recursive_mnt(): Update comment to match code
Message-Id: <200910181712.06361.agruen@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Andreas Gruenbacher <agruen@suse.de>

---
 fs/namespace.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index bdc3cb4..72c068d 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1272,9 +1272,9 @@ static int invent_group_ids(struct vfsmount *mnt, bool 
recurse)
 }
 
 /*
- *  @source_mnt : mount tree to be attached
- *  @nd         : place the mount tree @source_mnt is attached
- *  @parent_nd  : if non-null, detach the source_mnt from its parent and
+ *  @source_mnt  : mount tree to be attached
+ *  @path        : place the mount tree @source_mnt is attached
+ *  @parent_path : if non-null, detach the source_mnt from its parent and
  *  		   store the parent mount and mountpoint dentry.
  *  		   (done when source_mnt is moved)
  *
