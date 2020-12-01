From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Dec 2020 07:03:28 +0000
Subject: [PATCH] iio: sx9310: Off by one in sx9310_read_thresh()
Message-Id: <X8XqwK0z//8sSWJR@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This > should be >= to prevent reading one element beyond the end of
the sx9310_pthresh_codes[] array.

Fixes: ad2b473e2ba3 ("iio: sx9310: Support setting proximity thresholds")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iio/proximity/sx9310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index a2f820997afc..62eacb22e9bc 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -601,7 +601,7 @@ static int sx9310_read_thresh(struct sx9310_data *data,
 		return ret;
 
 	regval = FIELD_GET(SX9310_REG_PROX_CTRL8_9_PTHRESH_MASK, regval);
-	if (regval > ARRAY_SIZE(sx9310_pthresh_codes))
+	if (regval >= ARRAY_SIZE(sx9310_pthresh_codes))
 		return -EINVAL;
 
 	*val = sx9310_pthresh_codes[regval];
-- 
2.29.2
