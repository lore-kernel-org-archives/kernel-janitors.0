From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 14:26:54 +0000
Subject: [PATCH] mfd/si476x-i2c: Delete an error message for a failed memory allocation in si476x_core_probe(
Message-Id: <507039aa-cc06-4c3e-5e7e-07ce20aa7d3b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:10:33 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/si476x-i2c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index e6a3d999a376..2c5ec93333c3 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -697,11 +697,9 @@ static int si476x_core_probe(struct i2c_client *client,
 	int              cell_num;
 
 	core = devm_kzalloc(&client->dev, sizeof(*core), GFP_KERNEL);
-	if (!core) {
-		dev_err(&client->dev,
-			"failed to allocate 'struct si476x_core'\n");
+	if (!core)
 		return -ENOMEM;
-	}
+
 	core->client = client;
 
 	core->regmap = devm_regmap_init_si476x(core);
-- 
2.15.1

