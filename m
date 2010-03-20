From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 20 Mar 2010 14:12:42 +0000
Subject: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a leak
Message-Id: <1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

While looking for drivers which forgot to clear i2c_clientdata before freeing
the data structure it points to, I found that the pismo driver even has a leak
on the probe error path.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/mtd/maps/pismo.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index 30e12c8..86081bc 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -233,6 +233,7 @@ static int __devexit pismo_remove(struct i2c_client *client)
 	/* FIXME: set_vpp needs saner arguments */
 	pismo_setvpp_remove_fix(pismo);
 
+	i2c_set_clientdata(client, NULL);
 	kfree(pismo);
 
 	return 0;
@@ -271,7 +272,7 @@ static int __devinit pismo_probe(struct i2c_client *client,
 	ret = pismo_eeprom_read(client, &eeprom, 0, sizeof(eeprom));
 	if (ret < 0) {
 		dev_err(&client->dev, "error reading EEPROM: %d\n", ret);
-		return ret;
+		goto exit_free;
 	}
 
 	dev_info(&client->dev, "%.15s board found\n", eeprom.board);
@@ -282,6 +283,11 @@ static int __devinit pismo_probe(struct i2c_client *client,
 				      pdata->cs_addrs[i]);
 
 	return 0;
+
+ exit_free:
+	i2c_set_clientdata(client, NULL);
+	kfree(prismo);
+	return ret;
 }
 
 static const struct i2c_device_id pismo_id[] = {
-- 
1.7.0

