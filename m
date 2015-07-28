From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Jul 2015 15:49:25 +0000
Subject: [patch 2/2] staging: rtl8192e: don't just print an error and continue
Message-Id: <20150728154925.GB25739@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I was looking at how TOTAL_CAM_ENTRY is used and I saw this code.  We
print an error but continue writing "EntryNo" to a register as if it
were valid.  "EntryNo" is controlled by the user in rtl8192_ioctl() so
it definitely can be invalid.  I'm not positive what happens with the
invalid data but it can't be good.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index c146b7e..29dd93a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -117,8 +117,10 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		}
 	}
 	priv->rtllib->is_set_key = true;
-	if (EntryNo >= TOTAL_CAM_ENTRY)
+	if (EntryNo >= TOTAL_CAM_ENTRY) {
 		netdev_info(dev, "%s(): Invalid CAM entry\n", __func__);
+		return;
+	}
 
 	RT_TRACE(COMP_SEC,
 		 "==>to rtl92e_set_key(), dev:%p, EntryNo:%d, KeyIndex:%d,KeyType:%d, MacAddr %pM\n",
