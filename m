From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 May 2013 07:51:49 +0000
Subject: [patch] minix: bug widening a binary "not" operation
Message-Id: <20130516075148.GA7494@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"chunk_size" is an unsigned int and "pos" is an unsigned long.  The
"& ~(chunk_size-1)" operation clears the high 32 bits unintentionally.

The ALIGN() macro does the correct thing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/minix/dir.c b/fs/minix/dir.c
index a9ed6f3..09b0c96 100644
--- a/fs/minix/dir.c
+++ b/fs/minix/dir.c
@@ -95,7 +95,7 @@ static int minix_readdir(struct file * filp, void * dirent, filldir_t filldir)
 	char *name;
 	__u32 inumber;
 
-	pos = (pos + chunk_size-1) & ~(chunk_size-1);
+	pos = ALIGN(pos, chunk_size);
 	if (pos >= inode->i_size)
 		goto done;
 
