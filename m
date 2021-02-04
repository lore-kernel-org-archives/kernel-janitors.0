From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:58 +0000
Subject: [PATCH 4/5] fs: update kernel-doc for vfs_tmpfile()
Message-Id: <20210204180059.28360-5-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 6521f8917082 ("namei: prepare for idmapped mounts") adds kernel-doc
for vfs_tmpfile(), but with a small typo in one argument name.

Hence, make htmldocs warns on ./fs/namei.c:3396:

  warning: Function parameter or member 'open_flag' not described in 'vfs_tmpfile'
  warning: Excess function parameter 'open_flags' description in 'vfs_tmpfile'

Fix this typo in kernel-doc of vfs_tmpfile().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index 64a841dfbb3e..9f7d260ffb4b 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3379,7 +3379,7 @@ static int do_open(struct nameidata *nd,
  * @mnt_userns:	user namespace of the mount the inode was found from
  * @dentry:	pointer to dentry of the base directory
  * @mode:	mode of the new tmpfile
- * @open_flags:	flags
+ * @open_flag:	flags
  *
  * Create a temporary file.
  *
-- 
2.17.1
