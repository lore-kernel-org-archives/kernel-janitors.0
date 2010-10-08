From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:56:35 +0000
Subject: [patch] Staging: bcm: dereferencing before checking
Message-Id: <20101008125635.GL11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I moved the check to see if "Adapter" was null in front of the
dereference.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/CmHost.c b/drivers/staging/bcm/CmHost.c
index 37187c4..46f3a7d 100644
--- a/drivers/staging/bcm/CmHost.c
+++ b/drivers/staging/bcm/CmHost.c
@@ -1943,15 +1943,14 @@ ULONG SetUpTargetDsxBuffers(PMINI_ADAPTER Adapter)
 	ULONG ulIndex=0;
 	int Status;
 
+	if (!Adapter) {
+		BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "Adapter was NULL!!!");
+		return 0;
+	}
+
 	if(Adapter->astTargetDsxBuffer[0].ulTargetDsxBuffer)
 		return 1;
 
-	 if(NULL = Adapter)
-	 {
-		 BCM_DEBUG_PRINT( Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "Adapter was NULL!!!");
-		 return 0;
-	 }
-
 	BCM_DEBUG_PRINT( Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "Size of Each DSX Buffer(Also size of ServiceFlowParamSI): %zx ",sizeof(stServiceFlowParamSI));
 	BCM_DEBUG_PRINT( Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "Reading DSX buffer From Target location %x ",DSX_MESSAGE_EXCHANGE_BUFFER);
 
