From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2012 20:22:13 +0000
Subject: [patch] isp1704_charger: use after free on probe error
Message-Id: <20120327202212.GB9197@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton.vorontsov@linaro.org>, Felipe Contreras <felipe.contreras@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@ti.com>, Marek Vasut <marek.vasut@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't use "isp" after freeing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/isp1704_charger.c b/drivers/power/isp1704_charger.c
index 39eb50f..e5ccd29 100644
--- a/drivers/power/isp1704_charger.c
+++ b/drivers/power/isp1704_charger.c
@@ -474,13 +474,13 @@ static int __devinit isp1704_charger_probe(struct platform_device *pdev)
 fail2:
 	power_supply_unregister(&isp->psy);
 fail1:
+	isp1704_charger_set_power(isp, 0);
 	usb_put_transceiver(isp->phy);
 fail0:
 	kfree(isp);
 
 	dev_err(&pdev->dev, "failed to register isp1704 with error %d\n", ret);
 
-	isp1704_charger_set_power(isp, 0);
 	return ret;
 }
 
