From: Daniel Xu <dxu@dxuuu.xyz>
Date: Thu, 09 Apr 2020 06:27:29 +0000
Subject: [PATCH] xattr: fix uninitialized out-param
Message-Id: <20200409062729.1658747-1-dxu@dxuuu.xyz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tj@kernel.org, viro@zeniv.linux.org.uk
Cc: Daniel Xu <dxu@dxuuu.xyz>, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

`removed_sized` isn't correctly initialized (as the doc comment
suggests) on memory allocation failures. Fix by moving initialization up
a bit.

Fixes: 0c47383ba3bd ("kernfs: Add option to enable user xattrs")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---

I'm sending this through the cgroup tree b/c the original patchset went
through it. I don't believe the patchset has made its way into mainline
yet. Hopefully this is ok.

 fs/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/xattr.c b/fs/xattr.c
index e13265e65871..91608d9bfc6a 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -876,6 +876,9 @@ int simple_xattr_set(struct simple_xattrs *xattrs, const char *name,
 	struct simple_xattr *new_xattr = NULL;
 	int err = 0;
 
+	if (removed_size)
+		*removed_size = -1;
+
 	/* value = NULL means remove */
 	if (value) {
 		new_xattr = simple_xattr_alloc(value, size);
@@ -914,9 +917,6 @@ int simple_xattr_set(struct simple_xattrs *xattrs, const char *name,
 		list_add(&new_xattr->list, &xattrs->head);
 		xattr = NULL;
 	}
-
-	if (removed_size)
-		*removed_size = -1;
 out:
 	spin_unlock(&xattrs->lock);
 	if (xattr) {
-- 
2.26.0
