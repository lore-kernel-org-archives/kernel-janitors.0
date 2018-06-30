From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Jun 2018 12:04:47 +0000
Subject: [PATCH] vfs: make helper function to_mnt_ns static
Message-Id: <20180630120447.17861-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function to_mnt_ns is local to the source and does not need to be
in global scope, so make it static.

Cleans up sparse warning:
symbol 'to_mnt_ns' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 4e630dcb75c9..e7d2119656a4 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1641,7 +1641,7 @@ static bool is_mnt_ns_file(struct dentry *dentry)
 	       dentry->d_fsdata = &mntns_operations;
 }
 
-struct mnt_namespace *to_mnt_ns(struct ns_common *ns)
+static struct mnt_namespace *to_mnt_ns(struct ns_common *ns)
 {
 	return container_of(ns, struct mnt_namespace, ns);
 }
-- 
2.17.1

