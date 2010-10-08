From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:56:04 +0000
Subject: [patch] Staging: bcm: mocro expansion bug
Message-Id: <20101008125604.GK11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The WIMAX_MAX_MTU macro is used in drivers/staging/bcm/CmHost.c like
this:

    if (Adapter->PackInfo[uiSearchRuleIndex].uiMaxBucketSize < WIMAX_MAX_MTU * 8)

The multiplication by eight has precedence over the addition so the
macro needs parenthesis to work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/Macros.h b/drivers/staging/bcm/Macros.h
index 6ee1480..0241234 100644
--- a/drivers/staging/bcm/Macros.h
+++ b/drivers/staging/bcm/Macros.h
@@ -231,7 +231,7 @@ typedef enum _E_PHS_DSC_ACTION
 
 #define MAX_PENDING_CTRL_PACKET (MAX_CTRL_QUEUE_LEN-10)
 
-#define WIMAX_MAX_MTU 					MTU_SIZE + ETH_HLEN
+#define WIMAX_MAX_MTU			(MTU_SIZE + ETH_HLEN)
 #define AUTO_LINKUP_ENABLE              0x2
 #define AUTO_SYNC_DISABLE              	0x1
 #define AUTO_FIRM_DOWNLOAD              0x1
