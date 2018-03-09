From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:07:16 +0000
Subject: [PATCH v2 04/17] mfd: si476x-i2c: Delete an error message for a failed memory allocation in si476x_c
Message-Id: <77d99255-820d-1152-0c5c-88d8cd2f26ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Mar 2018 13:45:31 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a resend for this patch. The change was rebased
on source files from Linux next-20180308.

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
2.16.2

