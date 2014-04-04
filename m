From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Apr 2014 21:18:55 +0000
Subject: [patch] staging: r8188eu: cleanup by using "len" consistently
Message-Id: <20140404211855.GA13921@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"*(p + 1)" and "len" are the same thing.  For reviewers who don't know
that, then this code is worrying because we cap "len", but pass
"*(p + 1)" to memcpy().

I have changed the code to use "len" throughout.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 3ed5941..55be52f 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -6600,13 +6600,13 @@ u8 collect_bss_info(struct adapter *padapter, struct recv_frame *precv_frame, st
 		return _FAIL;
 	}
 
-	if (*(p + 1)) {
+	if (len) {
 		if (len > NDIS_802_11_LENGTH_SSID) {
 			DBG_88E("%s()-%d: IE too long (%d) for survey event\n", __func__, __LINE__, len);
 			return _FAIL;
 		}
-		memcpy(bssid->Ssid.Ssid, (p + 2), *(p + 1));
-		bssid->Ssid.SsidLength = *(p + 1);
+		memcpy(bssid->Ssid.Ssid, (p + 2), len);
+		bssid->Ssid.SsidLength = len;
 	} else {
 		bssid->Ssid.SsidLength = 0;
 	}
