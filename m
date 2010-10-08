From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Oct 2010 12:58:45 +0000
Subject: [patch] Staging: bcm: silence off by one warning
Message-Id: <20101008125845.GO11681@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"status" is used as an index into the Adapter->PackInfo[] array, which
has NO_OF_QUEUES elements.

This code actually works OK.  The SearchSfid() function always returns
a valid index or it returns NO_OF_QUEUES + 1.  But it looks sloppy and
it makes the static checkers complain.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/bcm/CmHost.c b/drivers/staging/bcm/CmHost.c
index 0329f7d..37187c4 100644
--- a/drivers/staging/bcm/CmHost.c
+++ b/drivers/staging/bcm/CmHost.c
@@ -2368,8 +2368,7 @@ int get_dsx_sf_data_to_application(PMINI_ADAPTER Adapter, UINT uiSFId, void __us
 	struct _packet_info *psSfInfo=NULL;
 	BCM_DEBUG_PRINT( Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "status =%d",status);
 	status = SearchSfid(Adapter, uiSFId);
-	if(status>NO_OF_QUEUES)
-	{
+	if (status  >= NO_OF_QUEUES) {
 		BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, CONN_MSG, DBG_LVL_ALL, "SFID %d not present in queue !!!", uiSFId );
 		return -EINVAL;
 	}
diff --git a/drivers/staging/bcm/Qos.c b/drivers/staging/bcm/Qos.c
index 913a1e1..75b2b87 100644
--- a/drivers/staging/bcm/Qos.c
+++ b/drivers/staging/bcm/Qos.c
@@ -587,8 +587,7 @@ USHORT ClassifyPacket(PMINI_ADAPTER Adapter,struct sk_buff* skb)
 			pstClassifierRule = &Adapter->astClassifierTable[uiLoopIndex];
 
 			uiSfIndex = SearchSfid(Adapter,pstClassifierRule->ulSFID);
-			if(uiSfIndex > NO_OF_QUEUES)
-			{
+			if (uiSfIndex >= NO_OF_QUEUES) {
 				BCM_DEBUG_PRINT(Adapter, DBG_TYPE_TX, IPV4_DBG, DBG_LVL_ALL,  "Queue Not Valid. SearchSfid for this classifier Failed\n");
 				break;
 			}
