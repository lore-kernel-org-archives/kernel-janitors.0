From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 13:10:40 +0000
Subject: [PATCH][next] net: hns3: remove redundant null check of an array
Message-Id: <20210203131040.21656-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831072949.7505-1-colin.king@canonical.com>
In-Reply-To: <20190831072949.7505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Guangbin Huang <huangguangbin2@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null check of filp->f_path.dentry->d_iname is redundant because
it is an array of DNAME_INLINE_LEN chars and cannot be a null. Fix
this by removing the null check.

Addresses-Coverity: ("Array compared against 0")
Fixes: 04987ca1b9b6 ("net: hns3: add debugfs support for tm nodes, priority and qset info")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
index 6978304f1ac5..c5958754f939 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
@@ -494,9 +494,6 @@ static ssize_t hns3_dbg_read(struct file *filp, char __user *buffer,
 	ssize_t size = 0;
 	int ret = 0;
 
-	if (!filp->f_path.dentry->d_iname)
-		return -EINVAL;
-
 	read_buf = kzalloc(HNS3_DBG_READ_LEN, GFP_KERNEL);
 	if (!read_buf)
 		return -ENOMEM;
-- 
2.29.2
