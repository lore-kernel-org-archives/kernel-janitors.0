From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 21:56:59 +0000
Subject: [PATCH] crypto/chcr: fix minor indentation issue
Message-Id: <20200918215659.49825-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented by one whitespace too deeply,
fix this by removing the whitespace.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/chelsio/chcr_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_core.c b/drivers/crypto/chelsio/chcr_core.c
index 40d51d2bd935..f91f9d762a45 100644
--- a/drivers/crypto/chelsio/chcr_core.c
+++ b/drivers/crypto/chelsio/chcr_core.c
@@ -127,7 +127,7 @@ static void chcr_dev_init(struct uld_ctx *u_ctx)
 
 static int chcr_dev_move(struct uld_ctx *u_ctx)
 {
-	 mutex_lock(&drv_data.drv_mutex);
+	mutex_lock(&drv_data.drv_mutex);
 	if (drv_data.last_dev = u_ctx) {
 		if (list_is_last(&drv_data.last_dev->entry, &drv_data.act_dev))
 			drv_data.last_dev = list_first_entry(&drv_data.act_dev,
-- 
2.27.0
