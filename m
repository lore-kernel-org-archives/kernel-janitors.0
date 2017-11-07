From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Nov 2017 12:43:22 +0000
Subject: [PATCH] power: supply: sbs-message: double left shift bug in sbsm_select()
Message-Id: <20171107124322.mm3fqkrggw3zidrx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Karl-Heinz Schneider <karl-heinz@schneider-inet.de>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code does this: "1 << (1 << 11)" which is undefined in C.

Fixes: dbc4deda03fe ("power: Adds support for Smart Battery System Manager")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

diff --git a/drivers/power/supply/sbs-manager.c b/drivers/power/supply/sbs-manager.c
index ccb4217b9638..cb6e8f66c7a2 100644
--- a/drivers/power/supply/sbs-manager.c
+++ b/drivers/power/supply/sbs-manager.c
@@ -183,7 +183,7 @@ static int sbsm_select(struct i2c_mux_core *muxc, u32 chan)
 		return ret;
 
 	/* chan goes from 1 ... 4 */
-	reg = 1 << BIT(SBSM_SMB_BAT_OFFSET + chan);
+	reg = BIT(SBSM_SMB_BAT_OFFSET + chan);
 	ret = sbsm_write_word(data->client, SBSM_CMD_BATSYSSTATE, reg);
 	if (ret)
 		dev_err(dev, "Failed to select channel %i\n", chan);
