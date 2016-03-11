From: Claudiu Beznea <claudiu.beznea@gmail.com>
Date: Fri, 11 Mar 2016 10:18:48 +0000
Subject: [PATCH] Staging: rtl8188eu: removed unnecessary check in core/rtw_ap.c
Message-Id: <1457691528-9731-1-git-send-email-claudiu.beznea@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Claudiu Beznea <claudiu.beznea@gmail.com>

This patch removes unnecessary "if (true)" check in update_BCNTIM()
from core/rtw_ap.c file. After this remove the code alignment was
necessary.

Signed-off-by: Claudiu Beznea <claudiu.beznea@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c | 131 ++++++++++++++++----------------
 1 file changed, 64 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index 79d326a..1959f65 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -76,90 +76,87 @@ static void update_BCNTIM(struct adapter *padapter)
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_bssid_ex *pnetwork_mlmeext = &(pmlmeinfo->network);
 	unsigned char *pie = pnetwork_mlmeext->IEs;
+	u8 *p, *dst_ie, *premainder_ie = NULL;
+	u8 *pbackup_remainder_ie = NULL;
+	uint offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
 
 	/* update TIM IE */
-	if (true) {
-		u8 *p, *dst_ie, *premainder_ie = NULL;
-		u8 *pbackup_remainder_ie = NULL;
-		uint offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
-
-		p = rtw_get_ie(pie + _FIXED_IE_LENGTH_, _TIM_IE_, &tim_ielen,
-				pnetwork_mlmeext->IELength - _FIXED_IE_LENGTH_);
-		if (p != NULL && tim_ielen > 0) {
-			tim_ielen += 2;
-			premainder_ie = p+tim_ielen;
-			tim_ie_offset = (int)(p - pie);
-			remainder_ielen = pnetwork_mlmeext->IELength -
-						tim_ie_offset - tim_ielen;
-			/* append TIM IE from dst_ie offset */
-			dst_ie = p;
-		} else {
-			tim_ielen = 0;
+	p = rtw_get_ie(pie + _FIXED_IE_LENGTH_, _TIM_IE_, &tim_ielen,
+			pnetwork_mlmeext->IELength - _FIXED_IE_LENGTH_);
+	if (p != NULL && tim_ielen > 0) {
+		tim_ielen += 2;
+		premainder_ie = p+tim_ielen;
+		tim_ie_offset = (int)(p - pie);
+		remainder_ielen = pnetwork_mlmeext->IELength -
+					tim_ie_offset - tim_ielen;
+		/* append TIM IE from dst_ie offset */
+		dst_ie = p;
+	} else {
+		tim_ielen = 0;
 
-			/* calculate head_len */
-			offset = _FIXED_IE_LENGTH_;
-			offset += pnetwork_mlmeext->Ssid.SsidLength + 2;
+		/* calculate head_len */
+		offset = _FIXED_IE_LENGTH_;
+		offset += pnetwork_mlmeext->Ssid.SsidLength + 2;
 
-			/*  get supported rates len */
-			p = rtw_get_ie(pie + _BEACON_IE_OFFSET_,
-					_SUPPORTEDRATES_IE_, &tmp_len,
-					(pnetwork_mlmeext->IELength -
-						_BEACON_IE_OFFSET_));
-			if (p !=  NULL)
-				offset += tmp_len+2;
+		/*  get supported rates len */
+		p = rtw_get_ie(pie + _BEACON_IE_OFFSET_,
+				_SUPPORTEDRATES_IE_, &tmp_len,
+				(pnetwork_mlmeext->IELength -
+					_BEACON_IE_OFFSET_));
+		if (p !=  NULL)
+			offset += tmp_len+2;
 
-			/* DS Parameter Set IE, len = 3 */
-			offset += 3;
+		/* DS Parameter Set IE, len = 3 */
+		offset += 3;
 
-			premainder_ie = pie + offset;
+		premainder_ie = pie + offset;
 
-			remainder_ielen = pnetwork_mlmeext->IELength -
-						offset - tim_ielen;
+		remainder_ielen = pnetwork_mlmeext->IELength -
+					offset - tim_ielen;
 
-			/* append TIM IE from offset */
-			dst_ie = pie + offset;
-		}
+		/* append TIM IE from offset */
+		dst_ie = pie + offset;
+	}
 
-		if (remainder_ielen > 0) {
-			pbackup_remainder_ie = rtw_malloc(remainder_ielen);
-			if (pbackup_remainder_ie && premainder_ie)
-				memcpy(pbackup_remainder_ie,
-						premainder_ie, remainder_ielen);
-		}
-		*dst_ie++ = _TIM_IE_;
+	if (remainder_ielen > 0) {
+		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
+		if (pbackup_remainder_ie && premainder_ie)
+			memcpy(pbackup_remainder_ie,
+					premainder_ie, remainder_ielen);
+	}
+	*dst_ie++ = _TIM_IE_;
 
-		if ((pstapriv->tim_bitmap&0xff00) &&
-				(pstapriv->tim_bitmap&0x00fc))
-			tim_ielen = 5;
-		else
-			tim_ielen = 4;
+	if ((pstapriv->tim_bitmap&0xff00) &&
+			(pstapriv->tim_bitmap&0x00fc))
+		tim_ielen = 5;
+	else
+		tim_ielen = 4;
 
-		*dst_ie++ = tim_ielen;
+	*dst_ie++ = tim_ielen;
 
-		*dst_ie++ = 0;/* DTIM count */
-		*dst_ie++ = 1;/* DTIM period */
+	*dst_ie++ = 0;/* DTIM count */
+	*dst_ie++ = 1;/* DTIM period */
 
-		if (pstapriv->tim_bitmap&BIT(0))/* for bc/mc frames */
-			*dst_ie++ = BIT(0);/* bitmap ctrl */
-		else
-			*dst_ie++ = 0;
+	if (pstapriv->tim_bitmap&BIT(0))/* for bc/mc frames */
+		*dst_ie++ = BIT(0);/* bitmap ctrl */
+	else
+		*dst_ie++ = 0;
 
-		if (tim_ielen = 4) {
-			*dst_ie++ = pstapriv->tim_bitmap & 0xff;
-		} else if (tim_ielen = 5) {
-			put_unaligned_le16(pstapriv->tim_bitmap, dst_ie);
-			dst_ie += 2;
-		}
+	if (tim_ielen = 4) {
+		*dst_ie++ = pstapriv->tim_bitmap & 0xff;
+	} else if (tim_ielen = 5) {
+		put_unaligned_le16(pstapriv->tim_bitmap, dst_ie);
+		dst_ie += 2;
+	}
 
-		/* copy remainder IE */
-		if (pbackup_remainder_ie) {
-			memcpy(dst_ie, pbackup_remainder_ie, remainder_ielen);
+	/* copy remainder IE */
+	if (pbackup_remainder_ie) {
+		memcpy(dst_ie, pbackup_remainder_ie, remainder_ielen);
 
-			kfree(pbackup_remainder_ie);
-		}
-		offset =  (uint)(dst_ie - pie);
-		pnetwork_mlmeext->IELength = offset + remainder_ielen;
+		kfree(pbackup_remainder_ie);
 	}
+	offset =  (uint)(dst_ie - pie);
+	pnetwork_mlmeext->IELength = offset + remainder_ielen;
 
 	set_tx_beacon_cmd(padapter);
 }
-- 
1.9.1

