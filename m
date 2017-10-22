From: Colin King <colin.king@canonical.com>
Date: Sun, 22 Oct 2017 16:58:40 +0000
Subject: [PATCH] ncpfs: remove unused redundant variables
Message-Id: <20171022165840.4024-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables oldnamelen, oldprivatelen and oldlen are assigned but
are never read and are redundant. Remove them. Cleans up the clang
build warnings:

fs/ncpfs/ioctl.c:674:4: warning: Value stored to 'oldnamelen' is
never read
fs/ncpfs/ioctl.c:676:4: warning: Value stored to 'oldprivatelen' is
never read
fs/ncpfs/ioctl.c:770:4: warning: Value stored to 'oldlen' is never
read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ncpfs/ioctl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ncpfs/ioctl.c b/fs/ncpfs/ioctl.c
index 12550c2320cc..85c6c60628e9 100644
--- a/fs/ncpfs/ioctl.c
+++ b/fs/ncpfs/ioctl.c
@@ -642,9 +642,7 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			struct ncp_objectname_ioctl user;
 			void* newname;
 			void* oldname;
-			size_t oldnamelen;
 			void* oldprivate;
-			size_t oldprivatelen;
 
 #ifdef CONFIG_COMPAT
 			if (cmd = NCP_IOC_SETOBJECTNAME_32) {
@@ -671,9 +669,7 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			}
 			down_write(&server->auth_rwsem);
 			oldname = server->auth.object_name;
-			oldnamelen = server->auth.object_name_len;
 			oldprivate = server->priv.data;
-			oldprivatelen = server->priv.len;
 			server->auth.auth_type = user.auth_type;
 			server->auth.object_name_len = user.object_name_len;
 			server->auth.object_name = newname;
@@ -742,7 +738,6 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			struct ncp_privatedata_ioctl user;
 			void* new;
 			void* old;
-			size_t oldlen;
 
 #ifdef CONFIG_COMPAT
 			if (cmd = NCP_IOC_SETPRIVATEDATA_32) {
@@ -767,7 +762,6 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
 			}
 			down_write(&server->auth_rwsem);
 			old = server->priv.data;
-			oldlen = server->priv.len;
 			server->priv.len = user.len;
 			server->priv.data = new;
 			up_write(&server->auth_rwsem);
-- 
2.14.1

