From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 13:38:12 +0000
Subject: [PATCH] 9p: make two arrays static const, makes object smaller
Message-Id: <20190906133812.17196-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, v9fs-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays on the stack but instead make them
static const. Makes the object code smaller by 386 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  17443	   2076	      0	  19519	   4c3f	fs/9p/vfs_inode_dotl.o

After:
   text	   data	    bss	    dec	    hex	filename
  16897	   2236	      0	  19133	   4abd	fs/9p/vfs_inode_dotl.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/9p/vfs_inode_dotl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 60328b21c5fb..961d8d0fa905 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -167,7 +167,7 @@ static int v9fs_mapped_dotl_flags(int flags)
 {
 	int i;
 	int rflags = 0;
-	struct dotl_openflag_map dotl_oflag_map[] = {
+	static const struct dotl_openflag_map dotl_oflag_map[] = {
 		{ O_CREAT,	P9_DOTL_CREATE },
 		{ O_EXCL,	P9_DOTL_EXCL },
 		{ O_NOCTTY,	P9_DOTL_NOCTTY },
@@ -512,7 +512,7 @@ static int v9fs_mapped_iattr_valid(int iattr_valid)
 {
 	int i;
 	int p9_iattr_valid = 0;
-	struct dotl_iattr_map dotl_iattr_map[] = {
+	static const struct dotl_iattr_map dotl_iattr_map[] = {
 		{ ATTR_MODE,		P9_ATTR_MODE },
 		{ ATTR_UID,		P9_ATTR_UID },
 		{ ATTR_GID,		P9_ATTR_GID },
-- 
2.20.1
