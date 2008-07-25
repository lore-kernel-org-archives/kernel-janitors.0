From: Julia Lawall <julia@diku.dk>
Date: Fri, 25 Jul 2008 19:33:25 +0000
Subject: [PATCH] fs/suse/inode.c: Add missing fuse_request_alloc
Message-Id: <Pine.LNX.4.64.0807252131280.1602@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: miklos@szeredi.hu, fuse-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The error handling code for the second call to fuse_request_alloc should
include freeing the result of the first one.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E;
statement S;
position p1,p2,p3;
@@

(
if ((x = fuse_request_alloc@p1(...)) = NULL || ...) S
|
x = fuse_request_alloc@p1(...)
... when != x
if (x = NULL || ...) S
)
<...
if@p3 (...) { ... when != fuse_request_free(x)
    return@p2 ...;
}
...>
(
return x;
|
return 0;
|
x = E
|
E = x
|
fuse_request_free(x)
)

@exists@
position r.p1,r.p2,r.p3;
expression x;
int ret != 0;
statement S;
@@

* x = fuse_request_alloc@p1(...)
  <...
* if@p3 (...)
  S
  ...>
* return@p2 \(NULL\|ret\);

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/fuse/inode.c               |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 3141690..ae1d4fd 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -690,7 +690,7 @@ static int fuse_fill_super(struct super_block *sb, void *data, int silent)
 	if (is_bdev) {
 		fc->destroy_req = fuse_request_alloc();
 		if (!fc->destroy_req)
-			goto err_put_root;
+			goto err_free_init_req;
 	}
 
 	mutex_lock(&fuse_mutex);
@@ -720,6 +720,7 @@ static int fuse_fill_super(struct super_block *sb, void *data, int silent)
 
  err_unlock:
 	mutex_unlock(&fuse_mutex);
+ err_free_init_req:
 	fuse_request_free(init_req);
  err_put_root:
 	dput(root_dentry);
