From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 May 2014 16:41:01 +0000
Subject: [patch] mfd: menelaus: typo in debug printk
Message-Id: <20140528164101.GA1824@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There should be a space between before the word "to".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index ad25bfa..0d5367f 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -475,9 +475,9 @@ static int menelaus_set_voltage(const struct menelaus_vtg *vtg, int mV,
 	val = ret & ~(((1 << vtg->vtg_bits) - 1) << vtg->vtg_shift);
 	val |= vtg_val << vtg->vtg_shift;
 
-	dev_dbg(&c->dev, "Setting voltage '%s'"
-			 "to %d mV (reg 0x%02x, val 0x%02x)\n",
-			vtg->name, mV, vtg->vtg_reg, val);
+	dev_dbg(&c->dev,
+		"Setting voltage '%s' to %d mV (reg 0x%02x, val 0x%02x)\n",
+		vtg->name, mV, vtg->vtg_reg, val);
 
 	ret = menelaus_write_reg(vtg->vtg_reg, val);
 	if (ret < 0)
