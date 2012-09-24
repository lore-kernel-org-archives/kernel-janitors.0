From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Mon, 24 Sep 2012 14:57:18 +0000
Subject: [patch] driver: staging: Coding Style correction and removal of unused macro
Message-Id: <506074C0.2090808@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed an unused macro. Plus, couple of grammatical and coding style fixes.

1) The macro _INLINE is not used anywhere. Anyways __inline is not portable.
2) Changed comment from "Not use" to "Unused" make it grammatically correct and
   to fit in 80 word limit.
3.) Removed space after *

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

diff -uprN a/drivers/staging/winbond/sme_api.h b/drivers/staging/winbond/sme_api.h
--- a/drivers/staging/winbond/sme_api.h	2012-09-17 03:28:51.000000000 +0530
+++ b/drivers/staging/winbond/sme_api.h	2012-09-24 19:16:27.972116003 +0530
@@ -12,7 +12,6 @@
 #include "localpara.h"
 
 /****************** CONSTANT AND MACRO SECTION ******************************/
-#define _INLINE				__inline
 
 #define MEDIA_STATE_DISCONNECTED	0
 #define MEDIA_STATE_CONNECTED		1
@@ -26,17 +25,17 @@
 
 /* OID_802_11_BSSID */
 s8 sme_get_bssid(void *pcore_data, u8 *pbssid);
-s8 sme_get_desired_bssid(void *pcore_data, u8 *pbssid); /* Not use */
+s8 sme_get_desired_bssid(void *pcore_data, u8 *pbssid); /* Unused */
 s8 sme_set_desired_bssid(void *pcore_data, u8 *pbssid);
 
 /* OID_802_11_SSID */
 s8 sme_get_ssid(void *pcore_data, u8 *pssid, u8 *pssid_len);
-s8 sme_get_desired_ssid(void *pcore_data, u8 *pssid, u8 *pssid_len);/* Not use */
+s8 sme_get_desired_ssid(void *pcore_data, u8 *pssid, u8 *pssid_len);/* Unused */
 s8 sme_set_desired_ssid(void *pcore_data, u8 *pssid, u8 ssid_len);
 
 /* OID_802_11_INFRASTRUCTURE_MODE */
 s8 sme_get_bss_type(void *pcore_data, u8 *pbss_type);
-s8 sme_get_desired_bss_type(void *pcore_data, u8 *pbss_type); /* Not use */
+s8 sme_get_desired_bss_type(void *pcore_data, u8 *pbss_type); /* Unused */
 s8 sme_set_desired_bss_type(void *pcore_data, u8 bss_type);
 
 /* OID_802_11_FRAGMENTATION_THRESHOLD */
@@ -138,7 +137,7 @@ s8 sme_set_txrate_policy(void *pcore_dat
 s8 sme_get_txrate_policy(void *pcore_data, u8 *policy);
 s8 sme_get_cwmin_value(void *pcore_data, u8 *cwmin);
 s8 sme_get_cwmax_value(void *pcore_data, u16 *cwmax);
-s8 sme_get_ms_radio_mode(void *pcore_data, u8 * pMsRadioOff);
+s8 sme_get_ms_radio_mode(void *pcore_data, u8 *pMsRadioOff);
 s8 sme_set_ms_radio_mode(void *pcore_data, u8 boMsRadioOff);
 
 void sme_get_tx_power_level(void *pcore_data, u32 *TxPower);


