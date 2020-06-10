From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Jun 2020 12:59:01 +0000
Subject: [PATCH] i2c: jz4780: remove redundant assignment to variable i
Message-Id: <20200610125901.1134204-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable i is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index ba831df6661e..fcdabfa3b5ee 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -691,7 +691,7 @@ static inline int jz4780_i2c_xfer_write(struct jz4780_i2c *i2c,
 static int jz4780_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
 			   int count)
 {
-	int i = -EIO;
+	int i;
 	int ret = 0;
 	struct jz4780_i2c *i2c = adap->algo_data;
 
-- 
2.27.0.rc0
