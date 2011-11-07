From: Marcos Paulo de Souza <marcos.mage@gmail.com>
Date: Mon, 07 Nov 2011 03:01:25 +0000
Subject: [PATCH] drivers/staging/vt6656/iwctl.c: Remove PRINT_K macro
Message-Id: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

As asked in the TODO file of the driver, the PRINT_K macro needs to be
removed.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/iwctl.c |   46 ++++++++++++++++++++----------------=
----
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/vt6656/iwctl.c b/drivers/staging/vt6656/iwctl.c
index 2121205..8c64928 100644
--- a/drivers/staging/vt6656/iwctl.c
+++ b/drivers/staging/vt6656/iwctl.c
@@ -157,18 +157,18 @@ int iwctl_siwscan(struct net_device *dev,
   if (!(pDevice->flags & DEVICE_FLAGS_OPENED))
         return -EINVAL;
=20
-    PRINT_K(" SIOCSIWSCAN\n");
+    DBG_PRT(MSG_LEVEL_INFO, KERN_INFO " SIOCSIWSCAN \n");
=20
 if (pMgmt->eScanState =3D  WMAC_IS_SCANNING) {
         // In scanning..
-     PRINT_K("SIOCSIWSCAN(overlap??)-->In scanning...\n");
+     DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWSCAN(overlap??)-->In scanni=
ng...\n");
      return -EAGAIN;
   }
=20
 if(pDevice->byReAssocCount > 0) {   //reject scan when re-associating!
 //send scan event to wpa_Supplicant
   union iwreq_data wrqu;
- PRINT_K("wireless_send_event--->SIOCGIWSCAN(scan done)\n");
+ DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "wireless_send_event--->SIOCGIWSCAN(sca=
n done)\n");
  memset(&wrqu, 0, sizeof(wrqu));
  wireless_send_event(pDevice->dev, SIOCGIWSCAN, &wrqu, NULL);
   return 0;
@@ -192,7 +192,7 @@ if(pDevice->byReAssocCount > 0) {   //reject scan when =
re-associating!
 	else
 	  pItemSSID->len =3D req->essid_len;
 	  pMgmt->eScanType =3D WMAC_SCAN_PASSIVE;
-         PRINT_K("SIOCSIWSCAN:[desired_ssid=3D%s,len=3D%d]\n",((PWLAN_IE_S=
SID)abyScanSSID)->abySSID,
+	  DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWSCAN:[desired_ssid=3D%s,len=
=3D%d]\n", ((PWLAN_IE_SSID)abyScanSSID)->abySSID,
 		 	                                                                      =
          ((PWLAN_IE_SSID)abyScanSSID)->len);
 	bScheduleCommand((void *) pDevice, WLAN_CMD_BSSID_SCAN, abyScanSSID);
 	spin_unlock_irq(&pDevice->lock);
@@ -665,7 +665,7 @@ int iwctl_siwap(struct net_device *dev,
     int rc =3D 0;
     BYTE                 ZeroBSSID[WLAN_BSSID_LEN]=3D{0x00,0x00,0x00,0x00,=
0x00,0x00};
=20
-   PRINT_K(" SIOCSIWAP \n");
+   DBG_PRT(MSG_LEVEL_INFO, KERN_INFO " SIOCSIWAP \n");
=20
 	if (wrq->sa_family !=3D ARPHRD_ETHER)
 		rc =3D -EINVAL;
@@ -675,7 +675,7 @@ int iwctl_siwap(struct net_device *dev,
 	//mike :add
 	 if ((is_broadcast_ether_addr(pMgmt->abyDesireBSSID)) ||
 	     (memcmp(pMgmt->abyDesireBSSID, ZeroBSSID, 6) =3D 0)){
-	      PRINT_K("SIOCSIWAP:invalid desired BSSID return!\n");
+	      DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWAP:invalid desired BSSID =
return!\n");
                return rc;
          }
        //mike add: if desired AP is hidden ssid(there are two same BSSID i=
n list),
@@ -690,7 +690,7 @@ int iwctl_siwap(struct net_device *dev,
                      }
                   }
 	     if(uSameBssidNum >=3D 2) {  //hit: desired AP is in hidden ssid mode=
!!!
-                 PRINT_K("SIOCSIWAP:ignore for desired AP in hidden mode\n=
");
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWAP:ignore for desired AP in hi=
dden mode\n");
 	        return rc;
 	     }
        	}
@@ -811,7 +811,7 @@ int iwctl_siwessid(struct net_device *dev,
 		// Just send an empty SSID list
 		memset(pMgmt->abyDesireSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
                   memset(pMgmt->abyDesireBSSID, 0xFF,6);
-	    PRINT_K("set essid to 'any' \n");
+	    DBG_PRT(MSG_LEVEL_INFO , KERN_INFO "set essid to 'any' \n");
            #ifdef WPA_SUPPLICANT_DRIVER_WEXT_SUPPORT
              //Unknown desired AP,so here need not associate??
                   return 0;
@@ -829,7 +829,7 @@ int iwctl_siwessid(struct net_device *dev,
          }
 	else
 	  pItemSSID->len =3D wrq->length;
-	PRINT_K("set essid to %s \n",pItemSSID->abySSID);
+	DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "set essid to %s\n", pItemSSID->abySSID=
);
=20
      //mike:need clear desiredBSSID
      if(pItemSSID->len=3D0) {
@@ -855,7 +855,7 @@ int iwctl_siwessid(struct net_device *dev,
                                       );
=20
             if (pCurr =3D NULL){
-               PRINT_K("SIOCSIWESSID:hidden ssid site survey before associ=
ate.......\n");
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWESSID:hidden ssid site survey =
before associate.......\n");
 	      vResetCommandTimer((void *) pDevice);
 	      pMgmt->eScanType =3D WMAC_SCAN_ACTIVE;
 	      bScheduleCommand((void *) pDevice,
@@ -875,7 +875,7 @@ int iwctl_siwessid(struct net_device *dev,
                      }
                   }
 	     if(uSameBssidNum >=3D 2) {  //hit: desired AP is in hidden ssid mode=
!!!
-                 PRINT_K("SIOCSIWESSID:hidden ssid directly associate.....=
..\n");
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWESSID:hidden ssid directly ass=
ociate.......\n");
 		 vResetCommandTimer((void *) pDevice);
 	        pMgmt->eScanType =3D WMAC_SCAN_PASSIVE;          //this scan type=
,you'll submit scan result!
 		bScheduleCommand((void *) pDevice,
@@ -1572,20 +1572,20 @@ int iwctl_siwauth(struct net_device *dev,
 	case IW_AUTH_WPA_VERSION:
 		wpa_version =3D wrq->value;
 		if(wrq->value =3D IW_AUTH_WPA_VERSION_DISABLED) {
-		       PRINT_K("iwctl_siwauth:set WPADEV to disable at 1??????\n");
+		       DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set WPADEV to di=
sable at 1??????\n");
 			//pDevice->bWPADEVUp =3D FALSE;
 		}
 		else if(wrq->value =3D IW_AUTH_WPA_VERSION_WPA) {
-                          PRINT_K("iwctl_siwauth:set WPADEV to WPA1******\=
n");
+			DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set WPADEV to WPA1****=
**\n");
 		}
 		else {
-                          PRINT_K("iwctl_siwauth:set WPADEV to WPA2******\=
n");
+			DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set WPADEV to WPA2****=
**\n");
 		}
 		//pDevice->bWPASuppWextEnabled =3DTRUE;
 		break;
 	case IW_AUTH_CIPHER_PAIRWISE:
 		pairwise =3D wrq->value;
-                   PRINT_K("iwctl_siwauth:set pairwise=3D%d\n",pairwise);
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set pairwise=3D%d\n", p=
airwise);
 		if(pairwise =3D IW_AUTH_CIPHER_CCMP){
 			pDevice->eEncryptionStatus =3D Ndis802_11Encryption3Enabled;
 		}else if(pairwise =3D IW_AUTH_CIPHER_TKIP){
@@ -1599,7 +1599,7 @@ int iwctl_siwauth(struct net_device *dev,
=20
 		break;
 	case IW_AUTH_CIPHER_GROUP:
-		 PRINT_K("iwctl_siwauth:set GROUP=3D%d\n",wrq->value);
+		 DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set GROUP=3D%d\n", wrq=
->value);
 		if(wpa_version =3D IW_AUTH_WPA_VERSION_DISABLED)
 			break;
 		if(pairwise =3D IW_AUTH_CIPHER_NONE){
@@ -1611,7 +1611,7 @@ int iwctl_siwauth(struct net_device *dev,
 		}
 		break;
 	case IW_AUTH_KEY_MGMT:
-                    PRINT_K("iwctl_siwauth(wpa_version=3D%d):set KEY_MGMT=
=3D%d\n",wpa_version,wrq->value);
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth(wpa_version=3D%d):set K=
EY_MGMT=3D%d\n", wpa_version, wrq->value);
 		if(wpa_version =3D IW_AUTH_WPA_VERSION_WPA2){
 			if(wrq->value =3D IW_AUTH_KEY_MGMT_PSK)
 				pMgmt->eAuthenMode =3D WMAC_AUTH_WPA2PSK;
@@ -1630,7 +1630,7 @@ int iwctl_siwauth(struct net_device *dev,
 	case IW_AUTH_DROP_UNENCRYPTED:
 		break;
 	case IW_AUTH_80211_AUTH_ALG:
-		 PRINT_K("iwctl_siwauth:set AUTH_ALG=3D%d\n",wrq->value);
+		 DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set AUTH_ALG=3D%d\n", =
wrq->value);
 		if(wrq->value=3DIW_AUTH_ALG_OPEN_SYSTEM){
 			pMgmt->bShareKeyAlgorithm=FALSE;
 		}else if(wrq->value=3DIW_AUTH_ALG_SHARED_KEY){
@@ -1658,7 +1658,7 @@ int iwctl_siwauth(struct net_device *dev,
 			pMgmt->bShareKeyAlgorithm =3D FALSE;
 			pMgmt->eAuthenMode =3D WMAC_AUTH_OPEN;
 			//pDevice->bWPADEVUp =3D FALSE;
-			 PRINT_K("iwctl_siwauth:set WPADEV to disaable at 2?????\n");
+			 DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwauth:set WPADEV to disaabl=
e at 2?????\n");
 		}
=20
 		break;
@@ -1770,7 +1770,7 @@ int iwctl_siwencodeext(struct net_device *dev,
     u8 key_array[64];
     int ret=3D0;
=20
-PRINT_K("SIOCSIWENCODEEXT...... \n");
+DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWENCODEEXT...... \n");
=20
 blen =3D sizeof(*param);
 buf =3D kmalloc((int)blen, (int)GFP_KERNEL);
@@ -1794,7 +1794,7 @@ switch (ext->alg) {
                   alg_name =3D WPA_ALG_CCMP;
 		break;
     default:
-		PRINT_K("Unknown alg =3D %d\n",ext->alg);
+		DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "Unknown alg =3D %d\n", ext->alg);
 		ret=3D -ENOMEM;
 		goto error;
 		}
@@ -1856,7 +1856,7 @@ if(param->u.wpa_key.alg_name =3D WPA_ALG_NONE) {
         }
 		 }
 if(pDevice->bwextstep3 =3D TRUE) {
-    PRINT_K("SIOCSIWENCODEEXT:Enable WPA WEXT SUPPORT!!!!!\n");
+    DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "SIOCSIWENCODEEXT:Enable WPA WEXT SU=
PPORT!!!!!\n");
      pDevice->bwextstep0 =3D FALSE;
      pDevice->bwextstep1 =3D FALSE;
      pDevice->bwextstep2 =3D FALSE;
@@ -1911,7 +1911,7 @@ int iwctl_siwmlme(struct net_device *dev,
 		//break;
 	case IW_MLME_DISASSOC:
 		if(pDevice->bLinkPass =3D TRUE){
-		  PRINT_K("iwctl_siwmlme--->send DISASSOCIATE\n");
+		  DBG_PRT(MSG_LEVEL_INFO, KERN_INFO "iwctl_siwmlme--->send DISASSOCIATE\=
n");
 		  bScheduleCommand((void *) pDevice,
 				   WLAN_CMD_DISASSOCIATE,
 				   NULL);
--=20
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
