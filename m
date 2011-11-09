From: Marcos Paulo de Souza <marcos.mage@gmail.com>
Date: Wed, 09 Nov 2011 20:35:57 +0000
Subject: [PATCH] drivers/staging/vt6656/wpa2.c: Change PRINT_K AND DBG_PRT macros for pr_debug
Message-Id: <1320870957-2583-1-git-send-email-marcos.mage@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed PRINT_K and DBG_PRT as said in the TODO file, changing these for
pr_debug.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/dpc.c  |  133 +++++++++++++++++++----------------------
 drivers/staging/vt6656/wpa2.c |   22 ++-----
 2 files changed, 69 insertions(+), 86 deletions(-)

diff --git a/drivers/staging/vt6656/dpc.c b/drivers/staging/vt6656/dpc.c
index c0edf97..6cb6e0d 100644
--- a/drivers/staging/vt6656/dpc.c
+++ b/drivers/staging/vt6656/dpc.c
@@ -56,14 +56,6 @@
 #include "datarate.h"
 #include "usbpipe.h"
 
-/*---------------------  Static Definitions -------------------------*/
-
-/*---------------------  Static Classes  ----------------------------*/
-
-/*---------------------  Static Variables  --------------------------*/
-//static int          msglevel                =MSG_LEVEL_DEBUG;
-static int          msglevel                =MSG_LEVEL_INFO;
-
 const BYTE acbyRxRate[MAX_RATE]  {2, 4, 11, 22, 12, 18, 24, 36, 48, 72, 96, 108};
 
@@ -362,7 +354,7 @@ RXbBulkInProcessData (
 
 
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"---------- RXbBulkInProcessData---\n");
+	pr_debug("---------- RXbBulkInProcessData---\n");
 
     skb = pRCB->skb;
 
@@ -372,13 +364,13 @@ RXbBulkInProcessData (
     FrameSize += 4;
 
     if (BytesToIndicate != FrameSize) {
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"---------- WRONG Length 1 \n");
+		pr_debug("---------- WRONG Length 1 \n");
         return FALSE;
     }
 
     if ((BytesToIndicate > 2372) || (BytesToIndicate <= 40)) {
         // Frame Size error drop this packet.
-	DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "---------- WRONG Length 2\n");
+		pr_debug("---------- WRONG Length 2\n");
         return FALSE;
     }
 
@@ -395,7 +387,7 @@ RXbBulkInProcessData (
          ((BytesToIndicate - (*pwPLCP_Length)) < 24) ||
          (BytesToIndicate < (*pwPLCP_Length)) ) {
 
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"Wrong PLCP Length %x\n", (int) *pwPLCP_Length);
+		pr_debug("Wrong PLCP Length %x\n", (int) *pwPLCP_Length);
         ASSERT(0);
         return FALSE;
     }
@@ -405,7 +397,7 @@ RXbBulkInProcessData (
         }
     }
     if ( ii=MAX_RATE ) {
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"Wrong RxRate %x\n",(int) *pbyRxRate);
+		pr_debug("Wrong RxRate %x\n",(int) *pbyRxRate);
         return FALSE;
     }
 
@@ -493,7 +485,7 @@ RXbBulkInProcessData (
     if (IS_FC_WEP(pbyFrame)) {
         BOOL     bRxDecryOK = FALSE;
 
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"rx WEP pkt\n");
+		pr_debug("rx WEP pkt\n");
         bIsWEP = TRUE;
         if ((pDevice->bEnableHostWEP) && (iSANodeIndex >= 0)) {
             pKey = &STempKey;
@@ -531,7 +523,7 @@ RXbBulkInProcessData (
 
         if (bRxDecryOK) {
             if ((*pbyNewRsr & NEWRSR_DECRYPTOK) = 0) {
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ICV Fail\n");
+			pr_debug("ICV Fail\n");
                 if ( (pMgmt->eAuthenMode = WMAC_AUTH_WPA) ||
                     (pMgmt->eAuthenMode = WMAC_AUTH_WPAPSK) ||
                     (pMgmt->eAuthenMode = WMAC_AUTH_WPANONE) ||
@@ -549,7 +541,7 @@ RXbBulkInProcessData (
                 return FALSE;
             }
         } else {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"WEP Func Fail\n");
+		pr_debug("WEP Func Fail\n");
             return FALSE;
         }
         if ((pKey != NULL) && (pKey->byCipherSuite = KEY_CTL_CCMP))
@@ -663,7 +655,7 @@ RXbBulkInProcessData (
             if ( !(*pbyRsr & RSR_BSSIDOK)) {
                 if (bDeFragRx) {
                     if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-                        DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+			pr_debug("%s: can not alloc more frag bufs\n",
                         pDevice->dev->name);
                     }
                 }
@@ -676,7 +668,7 @@ RXbBulkInProcessData (
                 !(*pbyRsr & RSR_BSSIDOK)) {
                 if (bDeFragRx) {
                     if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-                        DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+			pr_debug("%s: can not alloc more frag bufs\n",
                         pDevice->dev->name);
                     }
                 }
@@ -775,7 +767,7 @@ RXbBulkInProcessData (
         wEtherType = (skb->data[cbIVOffset + 8 + 24 + 6] << 8) |
                     skb->data[cbIVOffset + 8 + 24 + 6 + 1];
 
-	    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"wEtherType = %04x \n", wEtherType);
+	pr_debug("wEtherType = %04x \n", wEtherType);
         if (wEtherType = ETH_P_PAE) {
             skb->dev = pDevice->apdev;
 
@@ -854,13 +846,13 @@ RXbBulkInProcessData (
 
             if ((cpu_to_le32(*pdwMIC_L) != dwLocalMIC_L) || (cpu_to_le32(*pdwMIC_R) != dwLocalMIC_R) ||
                 (pDevice->bRxMICFail = TRUE)) {
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"MIC comparison is fail!\n");
+                pr_debug("MIC comparison is fail!\n");
                 pDevice->bRxMICFail = FALSE;
                 //pDevice->s802_11Counter.TKIPLocalMICFailures.QuadPart++;
                 pDevice->s802_11Counter.TKIPLocalMICFailures++;
                 if (bDeFragRx) {
                     if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-                        DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+			pr_debug("%s: can not alloc more frag bufs\n",
                             pDevice->dev->name);
                     }
                 }
@@ -885,7 +877,7 @@ RXbBulkInProcessData (
 					memcpy(ev.src_addr.sa_data, pMACHeader->abyAddr2, ETH_ALEN);
 					memset(&wrqu, 0, sizeof(wrqu));
 					wrqu.data.length = sizeof(ev);
-			PRINT_K("wireless_send_event--->IWEVMICHAELMICFAILURE\n");
+					pr_debug("wireless_send_event--->IWEVMICHAELMICFAILURE\n");
 					wireless_send_event(pDevice->dev, IWEVMICHAELMICFAILURE, &wrqu, (char *)&ev);
 
 				}
@@ -945,7 +937,7 @@ RXbBulkInProcessData (
                 if ( (wRxTSC15_0 < wLocalTSC15_0) &&
                      (dwRxTSC47_16 <= dwLocalTSC47_16) &&
                      !((dwRxTSC47_16 = 0) && (dwLocalTSC47_16 = 0xFFFFFFFF))) {
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"TSC is illegal~~!\n ");
+			pr_debug("TSC is illegal~~!\n ");
                     if (pKey->byCipherSuite = KEY_CTL_TKIP)
                         //pDevice->s802_11Counter.TKIPReplays.QuadPart++;
                         pDevice->s802_11Counter.TKIPReplays++;
@@ -955,7 +947,7 @@ RXbBulkInProcessData (
 
                     if (bDeFragRx) {
                         if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-                            DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+                            pr_debug("%s: can not alloc more frag bufs\n",
                                 pDevice->dev->name);
                         }
                     }
@@ -985,7 +977,7 @@ RXbBulkInProcessData (
 
             if (bDeFragRx) {
                 if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-                    DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+			pr_debug("%s: can not alloc more frag bufs\n",
                     pDevice->dev->name);
                 }
             }
@@ -1004,7 +996,7 @@ RXbBulkInProcessData (
     netif_rx(skb);
     if (bDeFragRx) {
         if (!device_alloc_frag_buf(pDevice, &pDevice->sRxDFCB[pDevice->uCurrentDFCBIdx])) {
-            DBG_PRT(MSG_LEVEL_ERR,KERN_ERR "%s: can not alloc more frag bufs\n",
+            pr_debug("%s: can not alloc more frag bufs\n",
                 pDevice->dev->name);
         }
         return FALSE;
@@ -1043,7 +1035,7 @@ static BOOL s_bAPModeRxCtl (
                                          (WLAN_MGMT_REASON_CLASS2_NONAUTH),
                                          &Status
                                          );
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: send vMgrDeAuthenBeginSta 1\n");
+			pr_debug("dpc: send vMgrDeAuthenBeginSta 1\n");
                     return TRUE;
                 }
                 if (pMgmt->sNodeDBTable[iSANodeIndex].eNodeState < NODE_ASSOC) {
@@ -1055,7 +1047,7 @@ static BOOL s_bAPModeRxCtl (
                                          (WLAN_MGMT_REASON_CLASS3_NONASSOC),
                                          &Status
                                          );
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: send vMgrDisassocBeginSta 2\n");
+			pr_debug("dpc: send vMgrDisassocBeginSta 2\n");
                     return TRUE;
                 }
 
@@ -1066,7 +1058,7 @@ static BOOL s_bAPModeRxCtl (
 			bScheduleCommand((void *) pDevice,
 					 WLAN_CMD_RX_PSPOLL,
 					 NULL);
-                        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: WLAN_CMD_RX_PSPOLL 1\n");
+			pr_debug("dpc: WLAN_CMD_RX_PSPOLL 1\n");
                     }
                     else {
                         // check Data PS state
@@ -1077,7 +1069,7 @@ static BOOL s_bAPModeRxCtl (
 				bScheduleCommand((void *) pDevice,
 						 WLAN_CMD_RX_PSPOLL,
 						 NULL);
-                            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: WLAN_CMD_RX_PSPOLL 2\n");
+				pr_debug("dpc: WLAN_CMD_RX_PSPOLL 2\n");
                         }
                     }
                 }
@@ -1095,7 +1087,7 @@ static BOOL s_bAPModeRxCtl (
 			bScheduleCommand((void *) pDevice,
 					 WLAN_CMD_RX_PSPOLL,
 					 NULL);
-                         DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: WLAN_CMD_RX_PSPOLL 3\n");
+				pr_debug("dpc: WLAN_CMD_RX_PSPOLL 3\n");
 
                       }
                    }
@@ -1108,14 +1100,12 @@ static BOOL s_bAPModeRxCtl (
                                        (WLAN_MGMT_REASON_CLASS2_NONAUTH),
                                        &Status
                                        );
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: send vMgrDeAuthenBeginSta 3\n");
-			DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "BSSID:%pM\n",
-				p802_11Header->abyAddr3);
-			DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "ADDR2:%pM\n",
-				p802_11Header->abyAddr2);
-			DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "ADDR1:%pM\n",
-				p802_11Header->abyAddr1);
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "dpc: wFrameCtl= %x\n", p802_11Header->wFrameCtl );
+			pr_debug("dpc: send vMgrDeAuthenBeginSta 3\n");
+			pr_debug("BSSID:%pM ADDR2:%pM ADDR1:%p dpc: wFrameCtl= %x\n",
+				p802_11Header->abyAddr3,
+				p802_11Header->abyAddr2,
+				p802_11Header->abyAddr1, 
+				p802_11Header->wFrameCtl);
                     return TRUE;
             }
         }
@@ -1155,7 +1145,7 @@ static BOOL s_bHandleRxEncryption (
     }
     byKeyIdx = (*(pbyIV+3) & 0xc0);
     byKeyIdx >>= 6;
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"\nKeyIdx: %d\n", byKeyIdx);
+	pr_debug("\nKeyIdx: %d\n", byKeyIdx);
 
     if ((pMgmt->eAuthenMode = WMAC_AUTH_WPA) ||
         (pMgmt->eAuthenMode = WMAC_AUTH_WPAPSK) ||
@@ -1165,14 +1155,14 @@ static BOOL s_bHandleRxEncryption (
         if (((*pbyRsr & (RSR_ADDRBROAD | RSR_ADDRMULTI)) = 0) &&
             (pMgmt->byCSSPK != KEY_CTL_NONE)) {
             // unicast pkt use pairwise key
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"unicast pkt\n");
+		pr_debug("unicast pkt\n");
             if (KeybGetKey(&(pDevice->sKey), pDevice->abyBSSID, 0xFFFFFFFF, &pKey) = TRUE) {
                 if (pMgmt->byCSSPK = KEY_CTL_TKIP)
                     byDecMode = KEY_CTL_TKIP;
                 else if (pMgmt->byCSSPK = KEY_CTL_CCMP)
                     byDecMode = KEY_CTL_CCMP;
             }
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"unicast pkt: %d, %p\n", byDecMode, pKey);
+		pr_debug("unicast pkt: %d, %p\n", byDecMode, pKey);
         } else {
             // use group key
             KeybGetKey(&(pDevice->sKey), pDevice->abyBSSID, byKeyIdx, &pKey);
@@ -1180,7 +1170,7 @@ static BOOL s_bHandleRxEncryption (
                 byDecMode = KEY_CTL_TKIP;
             else if (pMgmt->byCSSGK = KEY_CTL_CCMP)
                 byDecMode = KEY_CTL_CCMP;
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"group pkt: %d, %d, %p\n", byKeyIdx, byDecMode, pKey);
+		pr_debug("group pkt: %d, %d, %p\n", byKeyIdx, byDecMode, pKey);
         }
     }
     // our WEP only support Default Key
@@ -1194,10 +1184,10 @@ static BOOL s_bHandleRxEncryption (
     }
     *pKeyOut = pKey;
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"AES:%d %d %d\n", pMgmt->byCSSPK, pMgmt->byCSSGK, byDecMode);
+	pr_debug("AES:%d %d %d\n", pMgmt->byCSSPK, pMgmt->byCSSGK, byDecMode);
 
     if (pKey = NULL) {
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"pKey = NULL\n");
+	pr_debug("pKey = NULL\n");
         if (byDecMode = KEY_CTL_WEP) {
 //            pDevice->s802_11Counter.WEPUndecryptableCount.QuadPart++;
         } else if (pDevice->bLinkPass = TRUE) {
@@ -1238,13 +1228,13 @@ static BOOL s_bHandleRxEncryption (
 
         PayloadLen -= (WLAN_HDR_ADDR3_LEN + 8 + 4); // 24 is 802.11 header, 8 is IV&ExtIV, 4 is crc
         *pdwRxTSC47_16 = cpu_to_le32(*(PDWORD)(pbyIV + 4));
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ExtIV: %lx\n",*pdwRxTSC47_16);
+	pr_debug("ExtIV: %lx\n",*pdwRxTSC47_16);
         if (byDecMode = KEY_CTL_TKIP) {
             *pwRxTSC15_0 = cpu_to_le16(MAKEWORD(*(pbyIV+2), *pbyIV));
         } else {
             *pwRxTSC15_0 = cpu_to_le16(*(PWORD)pbyIV);
         }
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"TSC0_15: %x\n", *pwRxTSC15_0);
+	pr_debug("TSC0_15: %x\n", *pwRxTSC15_0);
 
         if ((byDecMode = KEY_CTL_TKIP) &&
             (pDevice->byLocalID <= REV_ID_VT3253_A1)) {
@@ -1256,10 +1246,10 @@ static BOOL s_bHandleRxEncryption (
             rc4_encrypt(&pDevice->SBox, pbyIV+8, pbyIV+8, PayloadLen);
             if (ETHbIsBufferCrc32Ok(pbyIV+8, PayloadLen)) {
                 *pbyNewRsr |= NEWRSR_DECRYPTOK;
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ICV OK!\n");
+		pr_debug("ICV OK!\n");
             } else {
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ICV FAIL!!!\n");
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"PayloadLen = %d\n", PayloadLen);
+		pr_debug("ICV FAIL!!!\n");
+		pr_debug("PayloadLen = %d\n", PayloadLen);
             }
         }
     }// end of TKIP/AES
@@ -1303,7 +1293,7 @@ static BOOL s_bHostWepRxEncryption (
     }
     byKeyIdx = (*(pbyIV+3) & 0xc0);
     byKeyIdx >>= 6;
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"\nKeyIdx: %d\n", byKeyIdx);
+	pr_debug("\nKeyIdx: %d\n", byKeyIdx);
 
 
     if (pMgmt->byCSSGK = KEY_CTL_TKIP)
@@ -1311,7 +1301,7 @@ static BOOL s_bHostWepRxEncryption (
     else if (pMgmt->byCSSGK = KEY_CTL_CCMP)
         byDecMode = KEY_CTL_CCMP;
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"AES:%d %d %d\n", pMgmt->byCSSPK, pMgmt->byCSSGK, byDecMode);
+	pr_debug("AES:%d %d %d\n", pMgmt->byCSSPK, pMgmt->byCSSGK, byDecMode);
 
     if (byDecMode != pKey->byCipherSuite) {
         if (byDecMode = KEY_CTL_WEP) {
@@ -1324,7 +1314,7 @@ static BOOL s_bHostWepRxEncryption (
 
     if (byDecMode = KEY_CTL_WEP) {
         // handle WEP
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"byDecMode = KEY_CTL_WEP \n");
+	pr_debug("byDecMode = KEY_CTL_WEP \n");
         if ((pDevice->byLocalID <= REV_ID_VT3253_A1) ||
             (((PSKeyTable)(pKey->pvKeyTable))->bSoftWEP = TRUE) ||
             (bOnFly = FALSE)) {
@@ -1349,14 +1339,14 @@ static BOOL s_bHostWepRxEncryption (
 
         PayloadLen -= (WLAN_HDR_ADDR3_LEN + 8 + 4); // 24 is 802.11 header, 8 is IV&ExtIV, 4 is crc
         *pdwRxTSC47_16 = cpu_to_le32(*(PDWORD)(pbyIV + 4));
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ExtIV: %lx\n",*pdwRxTSC47_16);
+	pr_debug("ExtIV: %lx\n",*pdwRxTSC47_16);
 
         if (byDecMode = KEY_CTL_TKIP) {
             *pwRxTSC15_0 = cpu_to_le16(MAKEWORD(*(pbyIV+2), *pbyIV));
         } else {
             *pwRxTSC15_0 = cpu_to_le16(*(PWORD)pbyIV);
         }
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"TSC0_15: %x\n", *pwRxTSC15_0);
+	pr_debug("TSC0_15: %x\n", *pwRxTSC15_0);
 
         if (byDecMode = KEY_CTL_TKIP) {
 
@@ -1364,17 +1354,16 @@ static BOOL s_bHostWepRxEncryption (
                 // Software TKIP
                 // 1. 3253 A
                 // 2. NotOnFly
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"soft KEY_CTL_TKIP \n");
+		pr_debug("soft KEY_CTL_TKIP \n");
                 pMACHeader = (PS802_11Header) (pbyFrame);
                 TKIPvMixKey(pKey->abyKey, pMACHeader->abyAddr2, *pwRxTSC15_0, *pdwRxTSC47_16, pDevice->abyPRNG);
                 rc4_init(&pDevice->SBox, pDevice->abyPRNG, TKIP_KEY_LEN);
                 rc4_encrypt(&pDevice->SBox, pbyIV+8, pbyIV+8, PayloadLen);
                 if (ETHbIsBufferCrc32Ok(pbyIV+8, PayloadLen)) {
                     *pbyNewRsr |= NEWRSR_DECRYPTOK;
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ICV OK!\n");
+			pr_debug("ICV OK!\n");
                 } else {
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"ICV FAIL!!!\n");
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"PayloadLen = %d\n", PayloadLen);
+			pr_debug("ICV FAIL!!! PayloadLen = %d\n", PayloadLen);
                 }
             }
         }
@@ -1383,12 +1372,12 @@ static BOOL s_bHostWepRxEncryption (
             if (bOnFly = FALSE) {
                 // Software CCMP
                 // NotOnFly
-                DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"soft KEY_CTL_CCMP\n");
+		pr_debug("soft KEY_CTL_CCMP\n");
                 if (AESbGenCCMP(pKey->abyKey, pbyFrame, FrameSize)) {
                     *pbyNewRsr |= NEWRSR_DECRYPTOK;
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"CCMP MIC compare OK!\n");
+			pr_debug("CCMP MIC compare OK!\n");
                 } else {
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"CCMP MIC fail!\n");
+			pr_debug("CCMP MIC fail!\n");
                 }
             }
         }
@@ -1431,7 +1420,7 @@ static BOOL s_bAPModeRxData (
 
         // if any node in PS mode, buffer packet until DTIM.
            if (skbcpy = NULL) {
-               DBG_PRT(MSG_LEVEL_NOTICE, KERN_INFO "relay multicast no skb available \n");
+		pr_debug("relay multicast no skb available \n");
            }
            else {
                skbcpy->dev = pDevice->dev;
@@ -1462,7 +1451,7 @@ static BOOL s_bAPModeRxData (
                     pMgmt->sNodeDBTable[iDANodeIndex].wEnQueueCnt++;
                     wAID = pMgmt->sNodeDBTable[iDANodeIndex].wAID;
                     pMgmt->abyPSTxMap[wAID >> 3] |=  byMask[wAID & 7];
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "relay: index= %d, pMgmt->abyPSTxMap[%d]= %d\n",
+			pr_debug("relay: index= %d, pMgmt->abyPSTxMap[%d]= %d\n",
                                iDANodeIndex, (wAID >> 3), pMgmt->abyPSTxMap[wAID >> 3]);
                     return TRUE;
                 }
@@ -1502,7 +1491,7 @@ void RXvWorkItem(void *Context)
     int ntStatus;
     PRCB            pRCB=NULL;
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"---->Rx Polling Thread\n");
+	pr_debug("---->Rx Polling Thread\n");
     spin_lock_irq(&pDevice->lock);
 
     while ((pDevice->Flags & fMP_POST_READS) &&
@@ -1529,7 +1518,7 @@ RXvFreeRCB(
     PSDevice pDevice = (PSDevice)pRCB->pDevice;
 
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"---->RXvFreeRCB\n");
+	pr_debug("---->RXvFreeRCB\n");
 
     ASSERT(!pRCB->Ref);     // should be 0
     ASSERT(pRCB->pDevice);  // shouldn't be NULL
@@ -1538,7 +1527,7 @@ RXvFreeRCB(
         pRCB->skb = dev_alloc_skb((int)pDevice->rx_buf_sz);
         // todo error handling
         if (pRCB->skb = NULL) {
-            DBG_PRT(MSG_LEVEL_ERR,KERN_ERR" Failed to re-alloc rx skb\n");
+		pr_debug(" Failed to re-alloc rx skb\n");
         }else {
             pRCB->skb->dev = pDevice->dev;
         }
@@ -1556,7 +1545,8 @@ RXvFreeRCB(
         pDevice->bIsRxWorkItemQueued = TRUE;
         tasklet_schedule(&pDevice->ReadWorkItem);
     }
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"<----RXFreeRCB %d %d\n",pDevice->NumRecvFreeList, pDevice->NumRecvMngList);
+	pr_debug("<----RXFreeRCB %d %d\n",pDevice->NumRecvFreeList,
+					  pDevice->NumRecvMngList);
 }
 
 
@@ -1567,7 +1557,7 @@ void RXvMngWorkItem(void *Context)
     PSRxMgmtPacket  pRxPacket;
     BOOL            bReAllocSkb = FALSE;
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"---->Rx Mng Thread\n");
+	pr_debug("---->Rx Mng Thread\n");
 
     spin_lock_irq(&pDevice->lock);
     while (pDevice->NumRecvMngList!=0)
@@ -1583,10 +1573,11 @@ void RXvMngWorkItem(void *Context)
 	vMgrRxManagePacket((void *) pDevice, &(pDevice->sMgmtObj), pRxPacket);
         pRCB->Ref--;
         if(pRCB->Ref = 0) {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"RxvFreeMng %d %d\n",pDevice->NumRecvFreeList, pDevice->NumRecvMngList);
+		pr_debug("RxvFreeMng %d %d\n",pDevice->NumRecvFreeList,
+					      pDevice->NumRecvMngList);
             RXvFreeRCB(pRCB, bReAllocSkb);
         } else {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"Rx Mng Only we have the right to free RCB\n");
+		pr_debug("Rx Mng Only we have the right to free RCB\n");
         }
     }
 
diff --git a/drivers/staging/vt6656/wpa2.c b/drivers/staging/vt6656/wpa2.c
index d4f3f75..4737225 100644
--- a/drivers/staging/vt6656/wpa2.c
+++ b/drivers/staging/vt6656/wpa2.c
@@ -34,13 +34,6 @@
 #include "wpa2.h"
 #include "device.h"
 
-/*---------------------  Static Definitions -------------------------*/
-static int          msglevel                =MSG_LEVEL_INFO;
-//static int          msglevel                =MSG_LEVEL_DEBUG;
-/*---------------------  Static Classes  ----------------------------*/
-
-/*---------------------  Static Variables  --------------------------*/
-
 const BYTE abyOUIGK[4]      = { 0x00, 0x0F, 0xAC, 0x00 };
 const BYTE abyOUIWEP40[4]   = { 0x00, 0x0F, 0xAC, 0x01 };
 const BYTE abyOUIWEP104[4]  = { 0x00, 0x0F, 0xAC, 0x05 };
@@ -117,7 +110,7 @@ WPA2vParseRSN (
     PBYTE               pbyOUI;
     BOOL                bUseGK = FALSE;
 
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"WPA2_ParseRSN: [%d]\n", pRSN->len);
+	pr_debug("WPA2_ParseRSN: [%d]\n", pRSN->len);
 
     WPA2_ClearRSN(pBSSNode);
 
@@ -136,8 +129,7 @@ WPA2vParseRSN (
     // information element header makes sense
     if ((pRSN->byElementID = WLAN_EID_RSN) &&
         (pRSN->wVersion = 1)) {
-
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"Legal 802.11i RSN\n");
+	pr_debug("Legal 802.11i RSN\n");
 
         pbyOUI = &(pRSN->abyRSN[0]);
         if ( !memcmp(pbyOUI, abyOUIWEP40, 4))
@@ -155,7 +147,7 @@ WPA2vParseRSN (
             // any vendor checks here
             pBSSNode->byCSSGK = WLAN_11i_CSS_UNKNOWN;
 
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"802.11i CSS: %X\n", pBSSNode->byCSSGK);
+	pr_debug("802.11i CSS: %X\n", pBSSNode->byCSSGK);
 
         if (pRSN->len = 6) {
             pBSSNode->bWPA2Valid = TRUE;
@@ -189,7 +181,7 @@ WPA2vParseRSN (
                         pBSSNode->abyCSSPK[j++] = WLAN_11i_CSS_UNKNOWN;
                     }
                     pbyOUI += 4;
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"abyCSSPK[%d]: %X\n", j-1, pBSSNode->abyCSSPK[j-1]);
+		pr_debug("abyCSSPK[%d]: %X\n", j-1, pBSSNode->abyCSSPK[j-1]);
                 } else
                     break;
             } //for
@@ -209,7 +201,7 @@ WPA2vParseRSN (
                 return;
             }
             pBSSNode->wCSSPKCount = (WORD)j;
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"wCSSPKCount: %d\n", pBSSNode->wCSSPKCount);
+		pr_debug("wCSSPKCount: %d\n", pBSSNode->wCSSPKCount);
         }
 
         m = *((PWORD) &(pRSN->abyRSN[4]));
@@ -227,12 +219,12 @@ WPA2vParseRSN (
                     else
                         // any vendor checks here
                         pBSSNode->abyAKMSSAuthType[j++] = WLAN_11i_AKMSS_UNKNOWN;
-                    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"abyAKMSSAuthType[%d]: %X\n", j-1, pBSSNode->abyAKMSSAuthType[j-1]);
+			pr_debug("abyAKMSSAuthType[%d]: %X\n", j-1, pBSSNode->abyAKMSSAuthType[j-1]);
                 } else
                     break;
             }
             pBSSNode->wAKMSSAuthCount = (WORD)j;
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"wAKMSSAuthCount: %d\n", pBSSNode->wAKMSSAuthCount);
+		pr_debug("wAKMSSAuthCount: %d\n", pBSSNode->wAKMSSAuthCount);
 
             n = *((PWORD) &(pRSN->abyRSN[6+4*m]));
             if (pRSN->len >= 12+4*m+4*n) { // ver(2)+GK(4)+PKCnt(2)+PKS(4*m)+AKMSSCnt(2)+AKMSS(4*n)+Cap(2)
-- 
1.7.4.4

