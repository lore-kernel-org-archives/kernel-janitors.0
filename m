From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Thu, 30 May 2013 05:48:30 +0000
Subject: [Patch] Staging: winbond: Made local functions static
Message-Id: <51A6E81C.2000303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Few functions are used only in one file. They are not included in any 
other .h or .c files (I used grep to check). They seem to be local functions.
So, I have made them static.
I have also inlined one function as it is a one line function.

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/reg.c |   25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff -uprN a/drivers/staging/winbond/reg.c b/drivers/staging/winbond/reg.c
--- a/drivers/staging/winbond/reg.c	2013-05-28 00:52:20.000000000 +0530
+++ b/drivers/staging/winbond/reg.c	2013-05-30 10:28:48.038634461 +0530
@@ -920,20 +920,20 @@ void Uxx_power_on_procedure(struct hw_da
 	Wb35Reg_WriteSync(pHwData, 0x03f8, 0x7ff);
 }
 
-void Set_ChanIndep_RfData_al7230_24(struct hw_data *pHwData, u32 *pltmp , char number)
+static void Set_ChanIndep_RfData_al7230_24(struct hw_data *pHwData, u32 *pltmp, 
+					char number)
 {
 	u8	i;
-
 	for (i = 0; i < number; i++) {
 		pHwData->phy_para[i] = al7230_rf_data_24[i];
 		pltmp[i] = (1 << 31) | (0 << 30) | (24 << 24) | (al7230_rf_data_24[i] & 0xffffff);
 	}
 }
 
-void Set_ChanIndep_RfData_al7230_50(struct hw_data *pHwData, u32 *pltmp, char number)
+static void Set_ChanIndep_RfData_al7230_50(struct hw_data *pHwData, u32 *pltmp, 
+					char number)
 {
 	u8	i;
-
 	for (i = 0; i < number; i++) {
 		pHwData->phy_para[i] = al7230_rf_data_50[i];
 		pltmp[i] = (1 << 31) | (0 << 30) | (24 << 24) | (al7230_rf_data_50[i] & 0xffffff);
@@ -1263,7 +1263,7 @@ void RFSynthesizer_initial(struct hw_dat
 	}
 }
 
-void BBProcessor_AL7230_2400(struct hw_data *pHwData)
+static void BBProcessor_AL7230_2400(struct hw_data *pHwData)
 {
 	struct wb35_reg *reg = &pHwData->reg;
 	u32	pltmp[12];
@@ -1304,7 +1304,7 @@ void BBProcessor_AL7230_2400(struct hw_d
 	Wb35Reg_BurstWrite(pHwData, 0x1030, pltmp, 12, AUTO_INCREMENT);
 }
 
-void BBProcessor_AL7230_5000(struct hw_data *pHwData)
+static void BBProcessor_AL7230_5000(struct hw_data *pHwData)
 {
 	struct wb35_reg *reg = &pHwData->reg;
 	u32	pltmp[12];
@@ -1620,22 +1620,24 @@ void BBProcessor_initial(struct hw_data
 		reg->SQ3_filter[i] = 0x2f; /* half of Bit 0 ~ 6 */
 }
 
-void set_tx_power_per_channel_max2829(struct hw_data *pHwData,  struct chan_info Channel)
+static inline void set_tx_power_per_channel_max2829(struct hw_data *pHwData,  
+						struct chan_info Channel)
 {
 	RFSynthesizer_SetPowerIndex(pHwData, 100);
 }
 
-void set_tx_power_per_channel_al2230(struct hw_data *pHwData,  struct chan_info Channel)
+static void set_tx_power_per_channel_al2230(struct hw_data *pHwData,  
+					struct chan_info Channel)
 {
 	u8	index = 100;
-
 	if (pHwData->TxVgaFor24[Channel.ChanNo - 1] != 0xff)
 		index = pHwData->TxVgaFor24[Channel.ChanNo - 1];
 
 	RFSynthesizer_SetPowerIndex(pHwData, index);
 }
 
-void set_tx_power_per_channel_al7230(struct hw_data *pHwData,  struct chan_info Channel)
+static void set_tx_power_per_channel_al7230(struct hw_data *pHwData,  
+					struct chan_info Channel)
 {
 	u8	i, index = 100;
 
@@ -1658,7 +1660,8 @@ void set_tx_power_per_channel_al7230(str
 	RFSynthesizer_SetPowerIndex(pHwData, index);
 }
 
-void set_tx_power_per_channel_wb242(struct hw_data *pHwData,  struct chan_info Channel)
+static void set_tx_power_per_channel_wb242(struct hw_data *pHwData,  
+					struct chan_info Channel)
 {
 	u8	index = 100;
 
