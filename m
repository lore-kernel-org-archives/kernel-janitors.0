From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:40:02 +0000
Subject: [patch]  Staging: rtl8192e: array overflow in set_swcam()
Message-Id: <20140328084002.GR25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"EntryNo" comes from the user in rtl8192_ioctl().  We should limit it
to 31 to prevent memory corruption.

Also we may as well return on invalid data in setKey() as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I'm not certain this fix is enough to solve the whole
problem.  Please review.

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index c46c65c..a6ca8982 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -87,6 +87,10 @@ void set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 	RT_TRACE(COMP_DBG, "======>%s():EntryNo is %d,KeyIndex is "
 		 "%d,KeyType is %d,is_mesh is %d\n", __func__, EntryNo,
 		 KeyIndex, KeyType, is_mesh);
+
+	if (EntryNo >= TOTAL_CAM_ENTRY)
+		return;
+
 	if (!is_mesh) {
 		ieee->swcamtable[EntryNo].bused = true;
 		ieee->swcamtable[EntryNo].key_index = KeyIndex;
@@ -121,8 +125,10 @@ void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 		}
 	}
 	priv->rtllib->is_set_key = true;
-	if (EntryNo >= TOTAL_CAM_ENTRY)
+	if (EntryNo >= TOTAL_CAM_ENTRY) {
 		RT_TRACE(COMP_ERR, "cam entry exceeds in setKey()\n");
+		return;
+	}
 
 	RT_TRACE(COMP_SEC, "==>to setKey(), dev:%p, EntryNo:%d, KeyIndex:%d,"
 		 "KeyType:%d, MacAddr %pM\n", dev, EntryNo, KeyIndex,
