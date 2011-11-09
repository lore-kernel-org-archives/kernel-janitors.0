From: Marcos Paulo de Souza <marcos.mage@gmail.com>
Date: Wed, 09 Nov 2011 20:37:13 +0000
Subject: [PATCH 1/2] drivers/staging/vt6656/iwctl.c: Change PRINT_K and DBG_PRT macros for pr_debug
Message-Id: <1320871033-2672-1-git-send-email-marcos.mage@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

As asked in the TODO file of this driver, the PRINTK and DBG_PRT macros
must be removed. The debug messages was improved too.

Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/iwctl.c |  135 ++++++++++++++++++++----------------=
----
 1 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/vt6656/iwctl.c b/drivers/staging/vt6656/iwctl.c
index 2121205..8c1ca49 100644
--- a/drivers/staging/vt6656/iwctl.c
+++ b/drivers/staging/vt6656/iwctl.c
@@ -68,7 +68,6 @@ static const long frequency_list[] =3D {
=20
=20
 //static int          msglevel                =3DMSG_LEVEL_DEBUG;
-static int          msglevel                =3DMSG_LEVEL_INFO;
=20
=20
 /*---------------------  Static Variables  --------------------------*/
@@ -110,7 +109,7 @@ static int iwctl_commit(struct net_device *dev,
 			      void *wrq,
 			      char *extra)
 {
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWCOMMIT\n");
+	pr_debug(" SIOCSIWCOMMIT\n");
=20
 	return 0;
 }
@@ -157,18 +156,18 @@ int iwctl_siwscan(struct net_device *dev,
   if (!(pDevice->flags & DEVICE_FLAGS_OPENED))
         return -EINVAL;
=20
-    PRINT_K(" SIOCSIWSCAN \n");
+   pr_debug("SIOCSIWSCAN - Set Scan\n");
=20
 if (pMgmt->eScanState =3D  WMAC_IS_SCANNING) {
         // In scanning..
-     PRINT_K("SIOCSIWSCAN(overlap??)-->In scanning...\n");
+     pr_debug("SIOCSIWSCAN(overlap??)-->In scanning...\n");
      return -EAGAIN;
   }
=20
 if(pDevice->byReAssocCount > 0) {   //reject scan when re-associating!
 //send scan event to wpa_Supplicant
   union iwreq_data wrqu;
- PRINT_K("wireless_send_event--->SIOCGIWSCAN(scan done)\n");
+ pr_debug("wireless_send_event--->SIOCGIWSCAN(scan done)\n");
  memset(&wrqu, 0, sizeof(wrqu));
  wireless_send_event(pDevice->dev, SIOCGIWSCAN, &wrqu, NULL);
   return 0;
@@ -192,7 +191,7 @@ if(pDevice->byReAssocCount > 0) {   //reject scan when =
re-associating!
 	else
 	  pItemSSID->len =3D req->essid_len;
 	  pMgmt->eScanType =3D WMAC_SCAN_PASSIVE;
-         PRINT_K("SIOCSIWSCAN:[desired_ssid=3D%s,len=3D%d]\n",((PWLAN_IE_S=
SID)abyScanSSID)->abySSID,
+         pr_debug("SIOCSIWSCAN:[desired_ssid=3D%s, len=3D%d]\n", ((PWLAN_I=
E_SSID)abyScanSSID)->abySSID,
 		 	                                                                      =
          ((PWLAN_IE_SSID)abyScanSSID)->len);
 	bScheduleCommand((void *) pDevice, WLAN_CMD_BSSID_SCAN, abyScanSSID);
 	spin_unlock_irq(&pDevice->lock);
@@ -238,7 +237,7 @@ int iwctl_giwscan(struct net_device *dev,
 	long ldBm;
 	char buf[MAX_WPA_IE_LEN * 2 + 30];
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWSCAN\n");
+	pr_debug(" SIOCGIWSCAN - Get scan results\n");
=20
     if (pMgmt->eScanState =3D  WMAC_IS_SCANNING) {
         // In scanning..
@@ -382,7 +381,7 @@ int iwctl_siwfreq(struct net_device *dev,
 	PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
 	int rc =3D 0;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWFREQ \n");
+	pr_debug(" SIOCSIWFREQ - Set frequence or channel\n");
=20
 	// If setting by frequency, convert to a channel
 	if((wrq->e =3D 1) &&
@@ -401,11 +400,11 @@ int iwctl_siwfreq(struct net_device *dev,
 	else {
 		int channel =3D wrq->m;
 		if((channel < 1) || (channel > 14)) {
-			DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "%s: New channel value of %d is inva=
lid!\n", dev->name, wrq->m);
+			pr_debug("%s: New channel value of %d is invalid!\n", dev->name, wrq->m=
);
 			rc =3D -EINVAL;
 		} else {
 			  // Yes ! We can set it !!!
-              DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " Set to channel =3D %d\n=
", channel);
+			pr_debug(" Set to channel =3D %d\n", channel);
 			  pDevice->uChannel =3D channel;
 		}
 	}
@@ -425,7 +424,7 @@ int iwctl_giwfreq(struct net_device *dev,
 	PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWFREQ \n");
+	pr_debug(" SIOCGIWFREQ - Get frequence or channel\n");
=20
 #ifdef WEXT_USECHANNELS
 	wrq->m =3D (int)pMgmt->uCurrChannel;
@@ -456,10 +455,10 @@ int iwctl_siwmode(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
     int rc =3D 0;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWMODE \n");
+	pr_debug(" SIOCSIWMODE - Set operation mode\n");
=20
     if (pMgmt->eCurrMode =3D WMAC_MODE_ESS_AP && pDevice->bEnableHostapd) {
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"Can't set operation mode, hosta=
pd is running \n");
+	pr_debug("Can't set operation mode, hostapd is running\n");
         return rc;
     }
=20
@@ -472,7 +471,7 @@ int iwctl_siwmode(struct net_device *dev,
 		        pDevice->bCommit =3D TRUE;
    		    }
 		}
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "set mode to ad-hoc \n");
+		pr_debug("set mode to ad-hoc\n");
 		break;
 	case IW_MODE_AUTO:
 	case IW_MODE_INFRA:
@@ -482,7 +481,7 @@ int iwctl_siwmode(struct net_device *dev,
 		        pDevice->bCommit =3D TRUE;
    		    }
 		}
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "set mode to infrastructure \n"=
);
+		pr_debug("set mode to infrastructure\n");
 		break;
 	case IW_MODE_MASTER:
=20
@@ -496,7 +495,7 @@ int iwctl_siwmode(struct net_device *dev,
 		        pDevice->bCommit =3D TRUE;
    		    }
 		}
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "set mode to Access Point \n");
+		pr_debug("set mode to Access Point\n");
 		break;
=20
 	case IW_MODE_REPEAT:
@@ -523,7 +522,7 @@ int iwctl_giwmode(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWMODE \n");
+	pr_debug(" SIOCGIWMODE - Get operation mode\n");
 	// If not managed, assume it's ad-hoc
 	switch (pMgmt->eConfigMode) {
 	case WMAC_CONFIG_ESS_STA:
@@ -559,7 +558,7 @@ int iwctl_giwrange(struct net_device *dev,
 	int		i,k;
     BYTE abySupportedRates[13]=3D {0x02, 0x04, 0x0B, 0x16, 0x0c, 0x12, 0x1=
8, 0x24, 0x30, 0x48, 0x60, 0x6C, 0x90};
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWRANGE\n");
+    pr_debug(" SIOCGIWRANGE - Get capability range\n");
 	if (wrq->pointer) {
 		wrq->length =3D sizeof(struct iw_range);
 		memset(range, 0, sizeof(struct iw_range));
@@ -665,7 +664,7 @@ int iwctl_siwap(struct net_device *dev,
     int rc =3D 0;
     BYTE                 ZeroBSSID[WLAN_BSSID_LEN]=3D{0x00,0x00,0x00,0x00,=
0x00,0x00};
=20
-   PRINT_K(" SIOCSIWAP \n");
+   pr_debug(" SIOCSIWAP - Set ap mac address\n");
=20
 	if (wrq->sa_family !=3D ARPHRD_ETHER)
 		rc =3D -EINVAL;
@@ -675,7 +674,7 @@ int iwctl_siwap(struct net_device *dev,
 	//mike :add
 	 if ((is_broadcast_ether_addr(pMgmt->abyDesireBSSID)) ||
 	     (memcmp(pMgmt->abyDesireBSSID, ZeroBSSID, 6) =3D 0)){
-	      PRINT_K("SIOCSIWAP:invalid desired BSSID return!\n");
+	      pr_debug("SIOCSIWAP:invalid desired BSSID return!\n");
                return rc;
          }
        //mike add: if desired AP is hidden ssid(there are two same BSSID i=
n list),
@@ -690,7 +689,7 @@ int iwctl_siwap(struct net_device *dev,
                      }
                   }
 	     if(uSameBssidNum >=3D 2) {  //hit: desired AP is in hidden ssid mode=
!!!
-                 PRINT_K("SIOCSIWAP:ignore for desired AP in hidden mode\n=
");
+                 pr_debug("SIOCSIWAP:ignore for desired AP in hidden mode\=
n");
 	        return rc;
 	     }
        	}
@@ -715,7 +714,7 @@ int iwctl_giwap(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWAP \n");
+    pr_debug(" SIOCGIWAP - Get ap mac address\n");
=20
     memcpy(wrq->sa_data, pMgmt->abyCurrBSSID, 6);
=20
@@ -751,7 +750,7 @@ int iwctl_giwaplist(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWAPLIST \n");
+    pr_debug(" SIOCGIWAPLIST - Get ap list\n");
 	// Only super-user can see AP list
=20
 	if (!capable(CAP_NET_ADMIN)) {
@@ -803,7 +802,7 @@ int iwctl_siwessid(struct net_device *dev,
   if (!(pDevice->flags & DEVICE_FLAGS_OPENED))
         return -EINVAL;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWESSID :\n");
+	pr_debug(" SIOCSIWESSID - Set essid\n");
=20
          pDevice->fWPA_Authened =3D FALSE;
 	// Check if we asked for `any'
@@ -811,7 +810,7 @@ int iwctl_siwessid(struct net_device *dev,
 		// Just send an empty SSID list
 		memset(pMgmt->abyDesireSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
                   memset(pMgmt->abyDesireBSSID, 0xFF,6);
-	    PRINT_K("set essid to 'any' \n");
+	    pr_debug("set essid to 'any'\n");
            #ifdef WPA_SUPPLICANT_DRIVER_WEXT_SUPPORT
              //Unknown desired AP,so here need not associate??
                   return 0;
@@ -829,7 +828,7 @@ int iwctl_siwessid(struct net_device *dev,
          }
 	else
 	  pItemSSID->len =3D wrq->length;
-	PRINT_K("set essid to %s \n",pItemSSID->abySSID);
+	pr_debug("set essid to %s\n", pItemSSID->abySSID);
=20
      //mike:need clear desiredBSSID
      if(pItemSSID->len=3D0) {
@@ -855,7 +854,7 @@ int iwctl_siwessid(struct net_device *dev,
                                       );
=20
             if (pCurr =3D NULL){
-               PRINT_K("SIOCSIWESSID:hidden ssid site survey before associ=
ate.......\n");
+               pr_debug("SIOCSIWESSID:hidden ssid site survey before assoc=
iate.......\n");
 	      vResetCommandTimer((void *) pDevice);
 	      pMgmt->eScanType =3D WMAC_SCAN_ACTIVE;
 	      bScheduleCommand((void *) pDevice,
@@ -875,7 +874,7 @@ int iwctl_siwessid(struct net_device *dev,
                      }
                   }
 	     if(uSameBssidNum >=3D 2) {  //hit: desired AP is in hidden ssid mode=
!!!
-                 PRINT_K("SIOCSIWESSID:hidden ssid directly associate.....=
..\n");
+                 pr_debug("SIOCSIWESSID:hidden ssid directly associate....=
...\n");
 		 vResetCommandTimer((void *) pDevice);
 	        pMgmt->eScanType =3D WMAC_SCAN_PASSIVE;          //this scan type=
,you'll submit scan result!
 		bScheduleCommand((void *) pDevice,
@@ -891,7 +890,7 @@ int iwctl_siwessid(struct net_device *dev,
   }
 	     #endif
=20
-	    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "set essid =3D %s \n", pItemSSID->=
abySSID);
+	    pr_debug("set essid =3D %s \n", pItemSSID->abySSID);
 	}
=20
     if (pDevice->flags & DEVICE_FLAGS_OPENED) {
@@ -917,7 +916,7 @@ int iwctl_giwessid(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
 	PWLAN_IE_SSID       pItemSSID;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWESSID \n");
+	pr_debug("SIOCGIWESSID - Get essid\n");
=20
 	// Note : if wrq->u.data.flags !=3D 0, we should
 	// get the relevant SSID from the SSID list...
@@ -950,7 +949,7 @@ int iwctl_siwrate(struct net_device *dev,
 	BYTE abySupportedRates[13]=3D {0x02, 0x04, 0x0B, 0x16, 0x0c, 0x12, 0x18, =
0x24, 0x30, 0x48, 0x60, 0x6C, 0x90};
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWRATE \n");
+	pr_debug("SIOCSIWRATE - Set data rate\n");
     if (!(pDevice->flags & DEVICE_FLAGS_OPENED)) {
         rc =3D -EINVAL;
         return rc;
@@ -1004,7 +1003,7 @@ int iwctl_siwrate(struct net_device *dev,
         }
         else {
             pDevice->uConnectionRate =3D brate;
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Fixed to Rate %d \n", pDev=
ice->uConnectionRate);
+            pr_debug("Fixed to Rate %d\n", pDevice->uConnectionRate);
         }
=20
 	}
@@ -1028,7 +1027,7 @@ int iwctl_giwrate(struct net_device *dev,
 	PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWRATE \n");
+	pr_debug(" SIOCGIWRATE - Get data rate\n");
     {
         BYTE abySupportedRates[13]=3D {0x02, 0x04, 0x0B, 0x16, 0x0c, 0x12,=
 0x18, 0x24, 0x30, 0x48, 0x60, 0x6C, 0x90};
 	    int brate =3D 0;
@@ -1077,7 +1076,7 @@ int iwctl_siwrts(struct net_device *dev,
 	PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
 	int rc =3D 0;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWRTS \n");
+	pr_debug("SIOCSIWRTS - Set rts threshould\n");
=20
 	{
 	    int rthr =3D wrq->value;
@@ -1104,7 +1103,7 @@ int iwctl_giwrts(struct net_device *dev,
 {
 	PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWRTS \n");
+	pr_debug("SIOCGIWRTS - Get rts\n");
 	wrq->value =3D pDevice->wRTSThreshold;
 	wrq->disabled =3D (wrq->value >=3D 2312);
 	wrq->fixed =3D 1;
@@ -1126,7 +1125,7 @@ int iwctl_siwfrag(struct net_device *dev,
     int fthr =3D wrq->value;
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWFRAG \n");
+	pr_debug("SIOCSIWFRAG - Set fragment threshould\n");
=20
=20
     if (wrq->disabled)
@@ -1152,7 +1151,7 @@ int iwctl_giwfrag(struct net_device *dev,
 {
     PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWFRAG \n");
+	pr_debug("SIOCGIWFRAG - Get fragment threshould\n");
 	wrq->value =3D pDevice->wFragmentationThreshold;
 	wrq->disabled =3D (wrq->value >=3D 2312);
 	wrq->fixed =3D 1;
@@ -1174,7 +1173,7 @@ int iwctl_siwretry(struct net_device *dev,
     int rc =3D 0;
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWRETRY \n");
+    pr_debug("SIOCSIWRETRY - Set retry threshould\n");
=20
 	if (wrq->disabled) {
 		rc =3D -EINVAL;
@@ -1209,7 +1208,7 @@ int iwctl_giwretry(struct net_device *dev,
              char *extra)
 {
     PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWRETRY \n");
+	pr_debug("SIOCGIWRETRY - Get retry threshould\n");
 	wrq->disabled =3D 0;      // Can't be disabled
=20
 	// Note : by default, display the min retry number
@@ -1246,7 +1245,7 @@ int iwctl_siwencode(struct net_device *dev,
 	int index =3D (wrq->flags & IW_ENCODE_INDEX);
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWENCODE \n");
+    pr_debug("SIOCSIWENCODE - Set encode mode\n");
=20
 	// Check the size of the key
 	if (wrq->length > WLAN_WEP232_KEYLEN) {
@@ -1266,20 +1265,20 @@ int iwctl_siwencode(struct net_device *dev,
 	if (wrq->length > 0) {
=20
         if (wrq->length =3D  WLAN_WEP232_KEYLEN) {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Set 232 bit wep key\n");
+            pr_debug("Set 232 bit wep key\n");
         }
         else if (wrq->length =3D  WLAN_WEP104_KEYLEN) {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Set 104 bit wep key\n");
+            pr_debug("Set 104 bit wep key\n");
         }
         else if (wrq->length =3D WLAN_WEP40_KEYLEN) {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Set 40 bit wep key, index=
=3D %d\n", (int)dwKeyIndex);
+            pr_debug("Set 40 bit wep key, index=3D %d\n", (int)dwKeyIndex);
         }
         memset(pDevice->abyKey, 0, WLAN_WEP232_KEYLEN);
         memcpy(pDevice->abyKey, extra, wrq->length);
=20
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO"abyKey: ");
+        pr_debug("abyKey: ");
         for (ii =3D 0; ii < wrq->length; ii++) {
-            DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "%02x ", pDevice->abyKey[ii=
]);
+            pr_debug("%02x ", pDevice->abyKey[ii]);
         }
=20
         if (pDevice->flags & DEVICE_FLAGS_OPENED) {
@@ -1311,7 +1310,7 @@ int iwctl_siwencode(struct net_device *dev,
 	// Read the flags
 	if(wrq->flags & IW_ENCODE_DISABLED){
=20
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Disable WEP function\n");
+		pr_debug("Disable WEP function\n");
 		pMgmt->bShareKeyAlgorithm =3D FALSE;
         pDevice->bEncryptionEnable =3D FALSE;
         pDevice->eEncryptionStatus =3D Ndis802_11EncryptionDisabled;
@@ -1323,11 +1322,11 @@ int iwctl_siwencode(struct net_device *dev,
         }
 	}
 	if(wrq->flags & IW_ENCODE_RESTRICTED) {
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Enable WEP & ShareKey System\n=
");
+		pr_debug("Enable WEP & ShareKey System\n");
 		pMgmt->bShareKeyAlgorithm =3D TRUE;
 	}
 	if(wrq->flags & IW_ENCODE_OPEN) {
-	    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Enable WEP & Open System\n");
+		pr_debug("Enable WEP & Open System\n");
 		pMgmt->bShareKeyAlgorithm =3D FALSE;
 	}
=20
@@ -1399,7 +1398,7 @@ int iwctl_giwencode(struct net_device *dev,
 	unsigned int index =3D (unsigned int)(wrq->flags & IW_ENCODE_INDEX);
 	PSKeyItem	pKey =3D NULL;
=20
-	DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWENCODE\n");
+	pr_debug("SIOCGIWENCODE\n");
=20
 	if (index > WLAN_WEP_NKEYS) {
 		return	-EINVAL;
@@ -1458,7 +1457,7 @@ int iwctl_siwpower(struct net_device *dev,
     PSMgmtObject        pMgmt =3D &(pDevice->sMgmtObj);
     int rc =3D 0;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWPOWER \n");
+	pr_debug("SIOCSIWPOWER - Set power mode\n");
=20
     if (!(pDevice->flags & DEVICE_FLAGS_OPENED)) {
 		 rc =3D -EINVAL;
@@ -1480,14 +1479,14 @@ int iwctl_siwpower(struct net_device *dev,
 	}
 	switch (wrq->flags & IW_POWER_MODE) {
 	case IW_POWER_UNICAST_R:
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWPOWER: IW_POWER_UNICAS=
T_R \n");
+		pr_debug(" SIOCSIWPOWER: IW_POWER_UNICAST_R\n");
 		rc =3D -EINVAL;
 		break;
 	case IW_POWER_ALL_R:
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWPOWER: IW_POWER_ALL_R =
\n");
+		pr_debug(" SIOCSIWPOWER: IW_POWER_ALL_R\n");
 		rc =3D -EINVAL;
 	case IW_POWER_ON:
-        DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWPOWER: IW_POWER_ON \n"=
);
+		pr_debug(" SIOCSIWPOWER: IW_POWER_ON\n");
 		break;
 	default:
 		rc =3D -EINVAL;
@@ -1509,7 +1508,7 @@ int iwctl_giwpower(struct net_device *dev,
     int mode =3D pDevice->ePSMode;
=20
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWPOWER \n");
+	pr_debug("SIOCGIWPOWER - Get power mode\n");
=20
=20
 	if ((wrq->disabled =3D (mode =3D WMAC_POWER_CAM)))
@@ -1539,7 +1538,7 @@ int iwctl_giwsens(struct net_device *dev,
     PSDevice	        pDevice =3D (PSDevice)netdev_priv(dev);
     long ldBm;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCGIWSENS \n");
+	pr_debug("SIOCGIWSENS - Get sensitivity\n");
     if (pDevice->bLinkPass =3D TRUE) {
         RFvRSSITodBm(pDevice, (BYTE)(pDevice->uCurrRSSI), &ldBm);
 	    wrq->value =3D ldBm;
@@ -1567,25 +1566,25 @@ int iwctl_siwauth(struct net_device *dev,
 	static int wpa_version=3D0;  //must be static to save the last value,eins=
n liu
 	static int pairwise=3D0;
=20
-    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWAUTH \n");
+	pr_debug("SIOCSIWAUTH\n");
 	switch (wrq->flags & IW_AUTH_INDEX) {
 	case IW_AUTH_WPA_VERSION:
 		wpa_version =3D wrq->value;
 		if(wrq->value =3D IW_AUTH_WPA_VERSION_DISABLED) {
-		       PRINT_K("iwctl_siwauth:set WPADEV to disable at 1??????\n");
+		       pr_debug("iwctl_siwauth:set WPADEV to disable at 1??????\n");
 			//pDevice->bWPADEVUp =3D FALSE;
 		}
 		else if(wrq->value =3D IW_AUTH_WPA_VERSION_WPA) {
-                          PRINT_K("iwctl_siwauth:set WPADEV to WPA1******\=
n");
+                          pr_debug("iwctl_siwauth:set WPADEV to WPA1******=
\n");
 		}
 		else {
-                          PRINT_K("iwctl_siwauth:set WPADEV to WPA2******\=
n");
+                          pr_debug("iwctl_siwauth:set WPADEV to WPA2******=
\n");
 		}
 		//pDevice->bWPASuppWextEnabled =3DTRUE;
 		break;
 	case IW_AUTH_CIPHER_PAIRWISE:
 		pairwise =3D wrq->value;
-                   PRINT_K("iwctl_siwauth:set pairwise=3D%d\n",pairwise);
+                   pr_debug("iwctl_siwauth:set pairwise=3D%d\n", pairwise);
 		if(pairwise =3D IW_AUTH_CIPHER_CCMP){
 			pDevice->eEncryptionStatus =3D Ndis802_11Encryption3Enabled;
 		}else if(pairwise =3D IW_AUTH_CIPHER_TKIP){
@@ -1599,7 +1598,7 @@ int iwctl_siwauth(struct net_device *dev,
=20
 		break;
 	case IW_AUTH_CIPHER_GROUP:
-		 PRINT_K("iwctl_siwauth:set GROUP=3D%d\n",wrq->value);
+		 pr_debug("iwctl_siwauth:set GROUP=3D%d\n", wrq->value);
 		if(wpa_version =3D IW_AUTH_WPA_VERSION_DISABLED)
 			break;
 		if(pairwise =3D IW_AUTH_CIPHER_NONE){
@@ -1611,7 +1610,7 @@ int iwctl_siwauth(struct net_device *dev,
 		}
 		break;
 	case IW_AUTH_KEY_MGMT:
-                    PRINT_K("iwctl_siwauth(wpa_version=3D%d):set KEY_MGMT=
=3D%d\n",wpa_version,wrq->value);
+                    pr_debug("iwctl_siwauth(wpa_version=3D%d):set KEY_MGMT=
=3D%d\n", wpa_version, wrq->value);
 		if(wpa_version =3D IW_AUTH_WPA_VERSION_WPA2){
 			if(wrq->value =3D IW_AUTH_KEY_MGMT_PSK)
 				pMgmt->eAuthenMode =3D WMAC_AUTH_WPA2PSK;
@@ -1630,7 +1629,7 @@ int iwctl_siwauth(struct net_device *dev,
 	case IW_AUTH_DROP_UNENCRYPTED:
 		break;
 	case IW_AUTH_80211_AUTH_ALG:
-		 PRINT_K("iwctl_siwauth:set AUTH_ALG=3D%d\n",wrq->value);
+		 pr_debug("iwctl_siwauth:set AUTH_ALG=3D%d\n", wrq->value);
 		if(wrq->value=3DIW_AUTH_ALG_OPEN_SYSTEM){
 			pMgmt->bShareKeyAlgorithm=FALSE;
 		}else if(wrq->value=3DIW_AUTH_ALG_SHARED_KEY){
@@ -1658,7 +1657,7 @@ int iwctl_siwauth(struct net_device *dev,
 			pMgmt->bShareKeyAlgorithm =3D FALSE;
 			pMgmt->eAuthenMode =3D WMAC_AUTH_OPEN;
 			//pDevice->bWPADEVUp =3D FALSE;
-			 PRINT_K("iwctl_siwauth:set WPADEV to disaable at 2?????\n");
+			 pr_debug("iwctl_siwauth:set WPADEV to disaable at 2?????\n");
 		}
=20
 		break;
@@ -1770,7 +1769,7 @@ int iwctl_siwencodeext(struct net_device *dev,
     u8 key_array[64];
     int ret=3D0;
=20
-PRINT_K("SIOCSIWENCODEEXT...... \n");
+pr_debug("SIOCSIWENCODEEXT...... \n");
=20
 blen =3D sizeof(*param);
 buf =3D kmalloc((int)blen, (int)GFP_KERNEL);
@@ -1794,7 +1793,7 @@ switch (ext->alg) {
                   alg_name =3D WPA_ALG_CCMP;
 		break;
     default:
-		PRINT_K("Unknown alg =3D %d\n",ext->alg);
+		pr_debug("Unknown alg =3D %d\n", ext->alg);
 		ret=3D -ENOMEM;
 		goto error;
 		}
@@ -1856,7 +1855,7 @@ if(param->u.wpa_key.alg_name =3D WPA_ALG_NONE) {
         }
 		 }
 if(pDevice->bwextstep3 =3D TRUE) {
-    PRINT_K("SIOCSIWENCODEEXT:Enable WPA WEXT SUPPORT!!!!!\n");
+    pr_debug("SIOCSIWENCODEEXT:Enable WPA WEXT SUPPORT!!!!!\n");
      pDevice->bwextstep0 =3D FALSE;
      pDevice->bwextstep1 =3D FALSE;
      pDevice->bwextstep2 =3D FALSE;
@@ -1911,7 +1910,7 @@ int iwctl_siwmlme(struct net_device *dev,
 		//break;
 	case IW_MLME_DISASSOC:
 		if(pDevice->bLinkPass =3D TRUE){
-		  PRINT_K("iwctl_siwmlme--->send DISASSOCIATE\n");
+		  pr_debug("iwctl_siwmlme--->send DISASSOCIATE\n");
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
