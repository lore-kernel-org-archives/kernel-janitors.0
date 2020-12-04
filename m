From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 17:38:33 +0000
Subject: [PATCH][next] media: rcar-vin: fix return, use ret instead of zero
Message-Id: <20201204173833.1146570-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the return error code is in ret is being assigned but not
used. It and should be returned by the return statement and currently
just 0 is being returned. Fix this.

Addresses-Coverity: ("Unused value")
Fixes: b9ad52aafe38 ("media: rcar-vin: Rework parallel firmware parsing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 98bff765b02e..e48d666f2c63 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -654,7 +654,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 out:
 	fwnode_handle_put(fwnode);
 
-	return 0;
+	return ret;
 }
 
 static int rvin_parallel_init(struct rvin_dev *vin)
-- 
2.29.2
