From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Nov 2010 04:37:49 +0000
Subject: [patch] Staging: bcm: signedness bug in StoreSFParam()
Message-Id: <20101113043749.GI3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

wrm() returns negative error codes so "ret" needs to be signed here.
There was place where wrm() returned positive EACCES instead of
negative -EACCES so I fixed that as well.  Also a few checkpatch.pl
issues.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/InterfaceMisc.c b/drivers/staging/bcm/InterfaceMisc.c
index b7d6e7a..81806b9 100644
--- a/drivers/staging/bcm/InterfaceMisc.c
+++ b/drivers/staging/bcm/InterfaceMisc.c
@@ -90,7 +90,7 @@ InterfaceWRM(PS_INTERFACE_ADAPTER psIntfAdapter,
 	if((psIntfAdapter->psAdapter->StopAllXaction = TRUE) && (psIntfAdapter->psAdapter->chip_id >= T3LPB))
 	{
 		BCM_DEBUG_PRINT(psIntfAdapter->psAdapter,DBG_TYPE_OTHERS, WRM, DBG_LVL_ALL,"Currently Xaction is not allowed on the bus...");
-		return EACCES;
+		return -EACCES;
 	}
 
 	if(psIntfAdapter->bSuspended =TRUE || psIntfAdapter->bPreparingForBusSuspend = TRUE)
diff --git a/drivers/staging/bcm/CmHost.c b/drivers/staging/bcm/CmHost.c
index a685cad..8e90b72 100644
--- a/drivers/staging/bcm/CmHost.c
+++ b/drivers/staging/bcm/CmHost.c
@@ -1649,17 +1649,17 @@ static inline ULONG RestoreSFParam(PMINI_ADAPTER Adapter, ULONG ulAddrSFParamSet
 static ULONG StoreSFParam(PMINI_ADAPTER Adapter,PUCHAR pucSrcBuffer,ULONG  ulAddrSFParamSet)
 {
     UINT	nBytesToWrite = sizeof(stServiceFlowParamSI);
-	UINT 	uiRetVal =0;
+	int ret = 0;
 
 	if(ulAddrSFParamSet = 0 || NULL = pucSrcBuffer)
 	{
 		return 0;
 	}
 
-	uiRetVal = wrm(Adapter,ulAddrSFParamSet,(PUCHAR)pucSrcBuffer, nBytesToWrite);
-	if(uiRetVal < 0) {
+	ret = wrm(Adapter, ulAddrSFParamSet, (u8 *)pucSrcBuffer, nBytesToWrite);
+	if (ret < 0) {
 		BCM_DEBUG_PRINT( Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL,  "%s:%d WRM failed",__FUNCTION__, __LINE__);
-		return uiRetVal;
+		return ret;
 	}
 	return 1;
 }
