From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 09:17:01 +0000
Subject: [patch] Staging: et131x: fix | vs & typos
Message-Id: <20120609091701.GE877@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These two places seem like they should be using bitwise OR instead of
bitwise AND.  The first one is a noop which is equivalent to:

	imr |= (0x0100 & 0x0004 & 0x0001);

The second is sets lcr2 to zero instead of just clearing the high bits.

	lcr2 &= (0x00F0 & 0x000F);

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware.

diff --git a/drivers/staging/et131x/et131x.c b/drivers/staging/et131x/et131x.c
index 5b11c5e..0582183 100644
--- a/drivers/staging/et131x/et131x.c
+++ b/drivers/staging/et131x/et131x.c
@@ -1767,8 +1767,8 @@ static void et131x_xcvr_init(struct et131x_adapter *adapter)
 	/* Set the link status interrupt only.  Bad behavior when link status
 	 * and auto neg are set, we run into a nested interrupt problem
 	 */
-	imr |= (ET_PHY_INT_MASK_AUTONEGSTAT &
-		ET_PHY_INT_MASK_LINKSTAT &
+	imr |= (ET_PHY_INT_MASK_AUTONEGSTAT |
+		ET_PHY_INT_MASK_LINKSTAT |
 		ET_PHY_INT_MASK_ENABLE);
 
 	et131x_mii_write(adapter, PHY_INTERRUPT_MASK, imr);
@@ -1784,7 +1784,7 @@ static void et131x_xcvr_init(struct et131x_adapter *adapter)
 	if ((adapter->eeprom_data[1] & 0x4) = 0) {
 		et131x_mii_read(adapter, PHY_LED_2, &lcr2);
 
-		lcr2 &= (ET_LED2_LED_100TX & ET_LED2_LED_1000T);
+		lcr2 &= (ET_LED2_LED_100TX | ET_LED2_LED_1000T);
 		lcr2 |= (LED_VAL_LINKON_ACTIVE << LED_LINK_SHIFT);
 
 		if ((adapter->eeprom_data[1] & 0x8) = 0)
