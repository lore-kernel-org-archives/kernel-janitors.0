From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 18 Sep 2019 08:30:33 +0000
Subject: [PATCH -next] erofs: fix return value check in erofs_read_superblock()
Message-Id: <20190918083033.47780-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Gao Xiang <gaoxiang25@huawei.com>
Cc: linux-erofs@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

In case of error, the function read_mapping_page() returns
ERR_PTR() not NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Fixes: fe7c2423570d ("erofs: use read_mapping_page instead of sb_bread")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/erofs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index caf9a95173b0..0e369494f2f2 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -105,9 +105,9 @@ static int erofs_read_superblock(struct super_block *sb)
 	int ret;
 
 	page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping, 0, NULL);
-	if (!page) {
+	if (IS_ERR(page)) {
 		erofs_err(sb, "cannot read erofs superblock");
-		return -EIO;
+		return PTR_ERR(page);
 	}
 
 	sbi = EROFS_SB(sb);
