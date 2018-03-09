From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:46:45 +0000
Subject: [PATCH v2 15/17] mfd: tps80031: Delete an error message for a failed memory allocation in tps80031_p
Message-Id: <25f40839-22b0-26de-591d-cfbbf4b28547@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Mar 2018 09:45:13 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a resend for this patch. The change was rebased
on source files from Linux next-20180308.

 drivers/mfd/tps80031.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/tps80031.c b/drivers/mfd/tps80031.c
index 0812df3b0d47..608c7f77830e 100644
--- a/drivers/mfd/tps80031.c
+++ b/drivers/mfd/tps80031.c
@@ -431,10 +431,8 @@ static int tps80031_probe(struct i2c_client *client,
 	}
 
 	tps80031 = devm_kzalloc(&client->dev, sizeof(*tps80031), GFP_KERNEL);
-	if (!tps80031) {
-		dev_err(&client->dev, "Malloc failed for tps80031\n");
+	if (!tps80031)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < TPS80031_NUM_SLAVES; i++) {
 		if (tps80031_slave_address[i] = client->addr)
-- 
2.16.2

