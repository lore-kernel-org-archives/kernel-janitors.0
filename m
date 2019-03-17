From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Mar 2019 23:09:09 +0000
Subject: [PATCH] hostfs: fix mismatch between link_file definition and declaration
Message-Id: <20190317230909.7373-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function link_file declaration in the header file has the order
of the two arguments (from, to) swapped when compared to the definition
arguments of (to, from).  Fix this by swapping them around to match
the definition.

This error predates the git history, so no idea when this error
was introduced.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/hostfs/hostfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hostfs/hostfs.h b/fs/hostfs/hostfs.h
index 33b8423ef0c9..f4295aa19350 100644
--- a/fs/hostfs/hostfs.h
+++ b/fs/hostfs/hostfs.h
@@ -87,7 +87,7 @@ extern int do_mkdir(const char *file, int mode);
 extern int hostfs_do_rmdir(const char *file);
 extern int do_mknod(const char *file, int mode, unsigned int major,
 		    unsigned int minor);
-extern int link_file(const char *from, const char *to);
+extern int link_file(const char *to, const char *from);
 extern int hostfs_do_readlink(char *file, char *buf, int size);
 extern int rename_file(char *from, char *to);
 extern int rename2_file(char *from, char *to, unsigned int flags);
-- 
2.20.1
