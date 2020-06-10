From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 09:59:34 +0000
Subject: [PATCH] exfat: call brelse() on error path
Message-Id: <20200610095934.GA35167@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <208cba7b-e535-c8e0-5ac7-f15170117a7f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

If the second exfat_get_dentry() call fails then we need to release
"old_bh" before returning.

Reported-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/exfat/namei.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 5b0f35329d63e..fda92c824ff11 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1077,10 +1077,14 @@ static int exfat_rename_file(struct inode *inode, struct exfat_chain *p_dir,
 
 		epold = exfat_get_dentry(sb, p_dir, oldentry + 1, &old_bh,
 			&sector_old);
+		if (!epold)
+			return -EIO;
 		epnew = exfat_get_dentry(sb, p_dir, newentry + 1, &new_bh,
 			&sector_new);
-		if (!epold || !epnew)
+		if (!epnew) {
+			brelse(old_bh);
 			return -EIO;
+		}
 
 		memcpy(epnew, epold, DENTRY_SIZE);
 		exfat_update_bh(sb, new_bh, sync);
-- 
2.26.2
