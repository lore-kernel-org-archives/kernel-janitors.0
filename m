From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 05 Jul 2017 05:50:54 +0000
Subject: [PATCH] mfd: Fix potential NULL pointer dereference
Message-Id: <20170705055054.8022-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

if 'max8998_i2c_parse_dt_pdata() fails (when out of memory), a NULL
pointer dereference will occur in the error handling code.

Return directly instead.

Fixes: ee999fb3f17f("mfd: max8998: Add support for Device Tree")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/max8998.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 4c33b8063bc3..b1d3f70782d9 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -192,10 +192,8 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 
 	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
 		pdata = max8998_i2c_parse_dt_pdata(&i2c->dev);
-		if (IS_ERR(pdata)) {
-			ret = PTR_ERR(pdata);
-			goto err;
-		}
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
 	}
 
 	i2c_set_clientdata(i2c, max8998);
-- 
2.11.0

