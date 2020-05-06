From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 14:25:54 +0000
Subject: [PATCH -next] exfat: fix possible memory leak in exfat_find()
Message-Id: <20200506142554.123748-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

'es' is malloced from exfat_get_dentry_set() in exfat_find() and should
be freed before leaving from the error handling cases, otherwise it will
cause memory leak.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/exfat/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index c241dd177f1a..48f4df883f3b 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -681,6 +681,7 @@ static int exfat_find(struct inode *dir, struct qstr *qname,
 			exfat_fs_error(sb,
 				"non-zero size file starts with zero cluster (size : %llu, p_dir : %u, entry : 0x%08x)",
 				i_size_read(dir), ei->dir.dir, ei->entry);
+			kfree(es);
 			return -EIO;
 		}
