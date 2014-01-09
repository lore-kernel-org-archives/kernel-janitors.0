From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 05:44:29 +0000
Subject: [patch] staging: bcm: clean up a type issue in ConfigureEndPointTypesThroughEEPROM()
Message-Id: <20140109054429.GA13954@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We only ever set the highest 4 bytes of ulReg.  This would cause a
problem on big endian systems.  The type should be u32 instead of
unsigned long.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm/InterfaceInit.c b/drivers/staging/bcm/InterfaceInit.c
index 3acdb58a10f5..94f32728f7c8 100644
--- a/drivers/staging/bcm/InterfaceInit.c
+++ b/drivers/staging/bcm/InterfaceInit.c
@@ -69,7 +69,7 @@ static void InterfaceAdapterFree(struct bcm_interface_adapter *psIntfAdapter)
 
 static void ConfigureEndPointTypesThroughEEPROM(struct bcm_mini_adapter *Adapter)
 {
-	unsigned long ulReg = 0;
+	u32 ulReg;
 	int bytes;
 
 	/* Program EP2 MAX_PKT_SIZE */
@@ -96,7 +96,7 @@ static void ConfigureEndPointTypesThroughEEPROM(struct bcm_mini_adapter *Adapter
 	BeceemEEPROMBulkWrite(Adapter, (PUCHAR)&ulReg, 0x140, 4, TRUE);
 
 	/* Program TX EP as interrupt(Alternate Setting) */
-	bytes = rdmalt(Adapter, 0x0F0110F8, (u32 *)&ulReg, sizeof(u32));
+	bytes = rdmalt(Adapter, 0x0F0110F8, &ulReg, sizeof(u32));
 	if (bytes < 0) {
 		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_INITEXIT, DRV_ENTRY, DBG_LVL_ALL,
 			"reading of Tx EP failed\n");
@@ -119,18 +119,18 @@ static void ConfigureEndPointTypesThroughEEPROM(struct bcm_mini_adapter *Adapter
 	 * Update EEPROM Version.
 	 * Read 4 bytes from 508 and modify 511 and 510.
 	 */
-	ReadBeceemEEPROM(Adapter, 0x1FC, (PUINT)&ulReg);
+	ReadBeceemEEPROM(Adapter, 0x1FC, &ulReg);
 	ulReg &= 0x0101FFFF;
 	BeceemEEPROMBulkWrite(Adapter, (PUCHAR)&ulReg, 0x1FC, 4, TRUE);
 
 	/* Update length field if required. Also make the string NULL terminated. */
 
-	ReadBeceemEEPROM(Adapter, 0xA8, (PUINT)&ulReg);
+	ReadBeceemEEPROM(Adapter, 0xA8, &ulReg);
 	if ((ulReg&0x00FF0000)>>16 > 0x30) {
 		ulReg = (ulReg&0xFF00FFFF)|(0x30<<16);
 		BeceemEEPROMBulkWrite(Adapter, (PUCHAR)&ulReg, 0xA8, 4, TRUE);
 	}
-	ReadBeceemEEPROM(Adapter, 0x148, (PUINT)&ulReg);
+	ReadBeceemEEPROM(Adapter, 0x148, &ulReg);
 	if ((ulReg&0x00FF0000)>>16 > 0x30) {
 		ulReg = (ulReg&0xFF00FFFF)|(0x30<<16);
 		BeceemEEPROMBulkWrite(Adapter, (PUCHAR)&ulReg, 0x148, 4, TRUE);
