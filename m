From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 21 Nov 2017 19:46:49 +0000
Subject: [PATCH] bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
Message-Id: <20171121194649.11724-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Error code returned by 'bnxt_read_sfp_module_eeprom_info()' is handled a
few lines above when reading the A0 portion of the EEPROM.
The same should be done when reading the A2 portion of the EEPROM.

In order to correctly propagate an error, update 'rc' in this 2nd call as
well, otherwise 0 (success) is returned.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-tested.

If not testing the result of the 2nd call was done on purpose, it should be
documented.
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
index 7ce1d4b7e67d..b13ce5ebde8d 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
@@ -2136,8 +2136,8 @@ static int bnxt_get_module_eeprom(struct net_device *dev,
 	/* Read A2 portion of the EEPROM */
 	if (length) {
 		start -= ETH_MODULE_SFF_8436_LEN;
-		bnxt_read_sfp_module_eeprom_info(bp, I2C_DEV_ADDR_A2, 1, start,
-						 length, data);
+		rc = bnxt_read_sfp_module_eeprom_info(bp, I2C_DEV_ADDR_A2, 1,
+						      start, length, data);
 	}
 	return rc;
 }
-- 
2.14.1

