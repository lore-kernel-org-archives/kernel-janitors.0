From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 16:58:36 +0000
Subject: [PATCH] net: stmmac: add sanity check to device_property_read_u32_array call
Message-Id: <20190617165836.4673-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to device_property_read_u32_array is not error checked
leading to potential garbage values in the delays array that are then used
in msleep delays.  Add a sanity check to the property fetching.

Addresses-Coverity: ("Uninitialized scalar variable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index da310de06bf6..5b7923c0698c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -242,6 +242,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	if (priv->device->of_node) {
 		struct gpio_desc *reset_gpio;
 		u32 delays[3];
+		int ret;
 
 		reset_gpio = devm_gpiod_get_optional(priv->device,
 						     "snps,reset",
@@ -249,9 +250,15 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (IS_ERR(reset_gpio))
 			return PTR_ERR(reset_gpio);
 
-		device_property_read_u32_array(priv->device,
-					       "snps,reset-delays-us",
-					       delays, ARRAY_SIZE(delays));
+		ret = device_property_read_u32_array(priv->device,
+						     "snps,reset-delays-us",
+						     delays,
+						     ARRAY_SIZE(delays));
+		if (ret) {
+			dev_err(ndev->dev.parent,
+				"invalid property snps,reset-delays-us\n");
+			return -EINVAL;
+		}
 
 		if (delays[0])
 			msleep(DIV_ROUND_UP(delays[0], 1000));
-- 
2.20.1
