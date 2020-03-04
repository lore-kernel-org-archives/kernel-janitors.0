From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Mar 2020 14:23:12 +0000
Subject: [PATCH] media: max2175: fix max2175_set_csm_mode() error code
Message-Id: <20200304142312.uxk7t7w3jbdhk5wy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramesh Shanmugasundaram <rashanmu@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to return negative error codes but the type is bool so
it returns true instead.

Fixes: b47b79d8a231 ("[media] media: i2c: max2175: Add MAX2175 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/max2175.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index 506a30e69ced..ab4bc6c395b2 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -503,7 +503,7 @@ static void max2175_set_bbfilter(struct max2175 *ctx)
 	}
 }
 
-static bool max2175_set_csm_mode(struct max2175 *ctx,
+static int max2175_set_csm_mode(struct max2175 *ctx,
 			  enum max2175_csm_mode new_mode)
 {
 	int ret = max2175_poll_csm_ready(ctx);
-- 
2.11.0
