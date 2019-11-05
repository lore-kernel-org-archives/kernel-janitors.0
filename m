From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 05 Nov 2019 14:33:40 +0000
Subject: [PATCH -next] crypto: hisilicon: move label err to #ifdef CONFIG_NUMA
Message-Id: <20191105143340.32950-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wangzhou1@hisilicon.com, herbert@gondor.apana.org.au, davem@davemloft.net, tanshukun1@huawei.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If CONFIG_NUMA is not set, there is error in function
find_zip_device:
drivers/crypto/hisilicon/zip/zip_main.c:154:13: error:
head undeclared (first use in this function)
  free_list(&head);

This is because CONFIG_NUMA is not defined, it should move
label err to #ifdef CONFIG_NUMA.

Fixes: 700f7d0d29c7 ("crypto: hisilicon - fix to return sub-optimal device when best device has no qps")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/crypto/hisilicon/zip/zip_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/hisilicon/zip/zip_main.c b/drivers/crypto/hisilicon/zip/zip_main.c
index 255b63c..0504fb2 100644
--- a/drivers/crypto/hisilicon/zip/zip_main.c
+++ b/drivers/crypto/hisilicon/zip/zip_main.c
@@ -150,10 +150,12 @@ struct hisi_zip *find_zip_device(int node)
 
 	return ret;
 
+#ifdef CONFIG_NUMA
 err:
 	free_list(&head);
 	mutex_unlock(&hisi_zip_list_lock);
 	return NULL;
+#endif
 }
 
 struct hisi_zip_hw_error {
-- 
2.7.4
