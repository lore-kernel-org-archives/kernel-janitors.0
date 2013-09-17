From: Shalin Mehta <shalinmehta85@gmail.com>
Date: Tue, 17 Sep 2013 07:04:40 +0000
Subject: [PATCH] Staging: bcm: PHSModule.c: Matching the function definition with function declaration
Message-Id: <1379401480-10149-1-git-send-email-shalinmehta85@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.or, klmckinney1@gmail.com, devel@driverdev.osuosl.org
Cc: shalinmehta85@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Shalin Mehta <shalinmehta85@gmail.com>

The function implementations of the PHSModule didn't match with the declaration. The functions are static
in the declaration but in the implemntation they are non-static

Signed-off-by: Shalin Mehta <shalinmehta85@gmail.com>
---
 drivers/staging/bcm/PHSModule.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/bcm/PHSModule.c b/drivers/staging/bcm/PHSModule.c
index af5d22f..56c5bee 100644
--- a/drivers/staging/bcm/PHSModule.c
+++ b/drivers/staging/bcm/PHSModule.c
@@ -596,7 +596,7 @@ ULONG PhsDeleteSFRules(IN void *pvContext, IN B_UINT16 uiVcid)
  * 0 if successful,
  * >0 Error.
  */
-ULONG PhsCompress(IN void *pvContext,
+static ULONG PhsCompress(IN void *pvContext,
 		IN B_UINT16 uiVcid,
 		IN B_UINT16 uiClsId,
 		IN void *pvInputBuffer,
@@ -677,7 +677,7 @@ ULONG PhsCompress(IN void *pvContext,
  * 0 if successful,
  * >0 Error.
  */
-ULONG PhsDeCompress(IN void *pvContext,
+static ULONG PhsDeCompress(IN void *pvContext,
 		IN B_UINT16 uiVcid,
 		IN void *pvInputBuffer,
 		OUT void *pvOutputBuffer,
@@ -829,7 +829,7 @@ UINT GetServiceFlowEntry(IN struct bcm_phs_table *psServiceFlowTable,
 	return PHS_INVALID_TABLE_INDEX;
 }
 
-UINT GetClassifierEntry(IN struct bcm_phs_classifier_table *pstClassifierTable,
+static UINT GetClassifierEntry(IN struct bcm_phs_classifier_table *pstClassifierTable,
 			IN B_UINT32 uiClsid, enum bcm_phs_classifier_context eClsContext,
 			OUT struct bcm_phs_classifier_entry **ppstClassifierEntry)
 {
@@ -880,7 +880,7 @@ static UINT GetPhsRuleEntry(IN struct bcm_phs_classifier_table *pstClassifierTab
 	return PHS_INVALID_TABLE_INDEX;
 }
 
-UINT CreateSFToClassifierRuleMapping(IN B_UINT16 uiVcid, IN B_UINT16  uiClsId,
+static UINT CreateSFToClassifierRuleMapping(IN B_UINT16 uiVcid, IN B_UINT16  uiClsId,
 				IN struct bcm_phs_table *psServiceFlowTable,
 				struct bcm_phs_rule *psPhsRule,
 				B_UINT8 u8AssociatedPHSI)
@@ -913,7 +913,7 @@ UINT CreateSFToClassifierRuleMapping(IN B_UINT16 uiVcid, IN B_UINT16  uiClsId,
 	return uiStatus;
 }
 
-UINT CreateClassiferToPHSRuleMapping(IN B_UINT16 uiVcid,
+static UINT CreateClassiferToPHSRuleMapping(IN B_UINT16 uiVcid,
 				IN B_UINT16 uiClsId,
 				IN struct bcm_phs_entry *pstServiceFlowEntry,
 				struct bcm_phs_rule *psPhsRule,
@@ -1239,7 +1239,7 @@ void DumpPhsRules(struct bcm_phs_extension *pDeviceExtension)
  *			header.
  *	0	-If PHS rule is NULL.If PHSI is 0 indicateing packet as uncompressed.
  */
-int phs_decompress(unsigned char *in_buf,
+static int phs_decompress(unsigned char *in_buf,
 		unsigned char *out_buf,
 		struct bcm_phs_rule *decomp_phs_rules,
 		UINT *header_size)
-- 
1.8.1.2

