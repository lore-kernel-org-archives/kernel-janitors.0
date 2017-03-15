From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:12 +0000
Subject: [PATCH 04/14] iio: dac: mcp4725: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-4-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/iio/dac/mcp4725.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
index db109f0cdd8c..3da207cf9020 100644
--- a/drivers/iio/dac/mcp4725.c
+++ b/drivers/iio/dac/mcp4725.c
@@ -473,7 +473,7 @@ static int mcp4725_probe(struct i2c_client *client,
 		goto err_disable_vref_reg;
 	}
 	pd = (inbuf[0] >> 1) & 0x3;
-	data->powerdown = pd > 0 ? true : false;
+	data->powerdown = pd > 0;
 	data->powerdown_mode = pd ? pd - 1 : 2; /* largest resistor to gnd */
 	data->dac_value = (inbuf[1] << 4) | (inbuf[2] >> 4);
 	if (data->id = MCP4726)
-- 
2.11.0

