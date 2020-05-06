From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 06 May 2020 03:28:24 +0000
Subject: [PATCH] i2c: puv3: Fix an error handling path in 'puv3_i2c_probe()'
Message-Id: <20200506032824.191633-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gxt@pku.edu.cn, arnd@arndb.de
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is a spurious 'put_device()' in the remove function.
A reference to 'pdev->dev' is taken in the probe function without a
corresponding 'get_device()' to increment the refcounted reference.

Add the missing 'get_device()' and update the error handling path
accordingly.

Fixes: d10e4a660d11 ("unicore32 machine related files: add i2c bus drivers for pkunity-v3 soc")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is provided as-is. It is not even compile tested because I don't
use cross-compiler.

It is purely speculative and based on what looks like an unbalanced
'put_device()' in the remove function.
---
 drivers/i2c/busses/i2c-puv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-puv3.c b/drivers/i2c/busses/i2c-puv3.c
index 5cec5a36807d..62a4b860d3c0 100644
--- a/drivers/i2c/busses/i2c-puv3.c
+++ b/drivers/i2c/busses/i2c-puv3.c
@@ -203,18 +203,20 @@ static int puv3_i2c_probe(struct platform_device *pdev)
 			mem->start);
 	adapter->algo = &puv3_i2c_algorithm;
 	adapter->class = I2C_CLASS_HWMON;
-	adapter->dev.parent = &pdev->dev;
+	adapter->dev.parent = get_device(&pdev->dev);
 
 	platform_set_drvdata(pdev, adapter);
 
 	adapter->nr = pdev->id;
 	rc = i2c_add_numbered_adapter(adapter);
 	if (rc)
-		goto fail_add_adapter;
+		goto fail_put_device;
 
 	dev_info(&pdev->dev, "PKUnity v3 i2c bus adapter.\n");
 	return 0;
 
+fail_put_device:
+	put_device(&pdev->dev);
 fail_add_adapter:
 	kfree(adapter);
 fail_nomem:
-- 
2.25.1
