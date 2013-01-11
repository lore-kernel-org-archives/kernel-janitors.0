From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2013 06:57:33 +0000
Subject: [patch] tg3: missing break statement in tg3_get_5720_nvram_info()
Message-Id: <20130111065733.GG13207@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <mchan@broadcom.com>
Cc: Matt Carlson <mcarlson@broadcom.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

There is a missing break statement so FLASH_5762_EEPROM_HD gets treated
like FLASH_5762_EEPROM_LD.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index bc4d989..642764e 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -13726,8 +13726,10 @@ static void tg3_get_5720_nvram_info(struct tg3 *tp)
 		switch (nvmpinstrp) {
 		case FLASH_5762_EEPROM_HD:
 			nvmpinstrp = FLASH_5720_EEPROM_HD;
+			break;
 		case FLASH_5762_EEPROM_LD:
 			nvmpinstrp = FLASH_5720_EEPROM_LD;
+			break;
 		}
 	}
 
