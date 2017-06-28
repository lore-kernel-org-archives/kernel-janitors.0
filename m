From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 12:19:37 +0000
Subject: [PATCH] phy: cpcap-usb: remove a stray tab
Message-Id: <20170628121936.mjupfdpqh7tl3bnk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This line was indented further that it should have been.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 9b63efa5ae4d..accaaaccb662 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -506,7 +506,7 @@ static void cpcap_usb_init_optional_gpios(struct cpcap_phy_ddata *ddata)
 		if (IS_ERR(ddata->gpio[i])) {
 			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
 				 i, PTR_ERR(ddata->gpio[i]));
-				 ddata->gpio[i] = NULL;
+			ddata->gpio[i] = NULL;
 		}
 	}
 }
