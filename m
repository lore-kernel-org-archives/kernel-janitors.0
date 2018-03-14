From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 14 Mar 2018 21:47:55 +0000
Subject: [PATCH] mfd: pcf50633: Fix some memory leaks in the error handling path of 'pcf50633_probe()'
Message-Id: <20180314214755.25853-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If a 'platform_device_alloc()' call fails, we still need to release the
resources that have already been allocated before returning.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/pcf50633-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index f952dff6765f..0d2a88d53eed 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -242,8 +242,10 @@ static int pcf50633_probe(struct i2c_client *client,
 
 	for (i = 0; i < PCF50633_NUM_REGULATORS; i++) {
 		pdev = platform_device_alloc("pcf50633-regulator", i);
-		if (!pdev)
-			return -ENOMEM;
+		if (!pdev) {
+			ret = -ENOMEM;
+			goto err2;
+		}
 
 		pdev->dev.parent = pcf->dev;
 		ret = platform_device_add_data(pdev, &pdata->reg_init_data[i],
@@ -269,6 +271,7 @@ static int pcf50633_probe(struct i2c_client *client,
 
 err:
 	platform_device_put(pdev);
+err2:
 	for (j = 0; j < i; j++)
 		platform_device_put(pcf->regulator_pdev[j]);
 
-- 
2.14.1

