From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 09:12:02 +0000
Subject: [PATCH] Staging: wilc1000: unlock on error in init_chip()
Message-Id: <20181221091202.GH2735@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

When there is an error in init_bus() then we need to call release_bus()
before we return.

Fixes: c5c77ba18ea6 ("staging: wilc1000: Add SDIO/SPI 802.11 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/wilc1000/wilc_wlan.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_wlan.c b/drivers/staging/wilc1000/wilc_wlan.c
index 3c5e9e030cad..489e5a5038f8 100644
--- a/drivers/staging/wilc1000/wilc_wlan.c
+++ b/drivers/staging/wilc1000/wilc_wlan.c
@@ -1252,21 +1252,22 @@ static u32 init_chip(struct net_device *dev)
 		ret = wilc->hif_func->hif_read_reg(wilc, 0x1118, &reg);
 		if (!ret) {
 			netdev_err(dev, "fail read reg 0x1118\n");
-			return ret;
+			goto release;
 		}
 		reg |= BIT(0);
 		ret = wilc->hif_func->hif_write_reg(wilc, 0x1118, reg);
 		if (!ret) {
 			netdev_err(dev, "fail write reg 0x1118\n");
-			return ret;
+			goto release;
 		}
 		ret = wilc->hif_func->hif_write_reg(wilc, 0xc0000, 0x71);
 		if (!ret) {
 			netdev_err(dev, "fail write reg 0xc0000\n");
-			return ret;
+			goto release;
 		}
 	}
 
+release:
 	release_bus(wilc, WILC_BUS_RELEASE_ONLY);
 
 	return ret;
-- 
2.17.1
