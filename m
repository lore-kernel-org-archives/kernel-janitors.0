From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:02:49 +0000
Subject: [patch] Squashfs: silence some uninitialized variable warnings
Message-Id: <20160713100249.GB29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We print these values in the TRACE() code before we check that
fill_meta_index() was successful.  It makes my static checker complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 13d8094..46679e2 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -334,9 +334,9 @@ failed:
  */
 static int read_blocklist(struct inode *inode, int index, u64 *block)
 {
-	u64 start;
+	u64 start = -1;
 	long long blks;
-	int offset;
+	int offset = -1;
 	__le32 size;
 	int res = fill_meta_index(inode, index, &start, &offset, block);
 
