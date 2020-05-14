From: Colin King <colin.king@canonical.com>
Date: Thu, 14 May 2020 18:19:26 +0000
Subject: [PATCH][next] fsinfo: fix an uninialized variable 'conn'
Message-Id: <20200514181926.16571-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable conn is not initialized and can potentially contain
garbage causing a false -EPERM return on the !conn check.
Fix this by initializing it to false.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: f2494de388bd ("fsinfo: Add an attribute that lists all the visible mounts in a namespace")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
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
2.25.1
