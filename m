From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2020 12:09:08 +0000
Subject: [PATCH] fsinfo: Fix uninitialized variable in fsinfo_generic_mount_all()
Message-Id: <20200515120908.GB575846@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "conn" variable is never set to false.

Fixes: f2494de388bd ("fsinfo: Add an attribute that lists all the visible mounts in a namespace")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The buggy commit looks like preliminary stuff not pushed to anywhere so
probably this can just be folded in.

 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 3fd24575756b..ae489cbac467 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -4433,7 +4433,7 @@ int fsinfo_generic_mount_all(struct path *path, struct fsinfo_context *ctx)
 	struct mnt_namespace *ns;
 	struct mount *m, *p;
 	struct path chroot;
-	bool conn;
+	bool conn = false;
 
 	m = real_mount(path->mnt);
 	ns = m->mnt_ns;
-- 
2.26.2
