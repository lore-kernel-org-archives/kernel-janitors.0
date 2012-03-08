From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Mar 2012 07:25:51 +0000
Subject: [patch] qnx6fs: silence a Sparse warning
Message-Id: <20120308072551.GA27713@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kai Bankett <chaosman@ontika.net>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Add a  __force to silence a sparse warning:
	fs/qnx6/inode.c:88:22: warning: cast to restricted __fs32

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index e44012d..acf9241 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -85,7 +85,7 @@ static int qnx6_get_block(struct inode *inode, sector_t iblock,
 
 static int qnx6_check_blockptr(__fs32 ptr)
 {
-	if (ptr = ~(__fs32)0) {
+	if (ptr = ~(__force __fs32)0) {
 		printk(KERN_ERR "qnx6: hit unused blockpointer.\n");
 		return 0;
 	}
