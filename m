From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2013 16:12:09 +0000
Subject: [patch] staging: vt6655: info leak in ioctl
Message-Id: <20130624161209.GA32503@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The SCmdLinkStatus struct has a couple holes.  There is one between
->bLink and ->wBSSType, and another between ->abySSID and ->uChannel.

I've added a memset() to initialize the struct to zero.  Since we don't
need to clear abySSID any more so I've removed that memset.  It was
wrong anyway: abySSID has "SSID_MAXLEN + 2" (34) bytes, not
"WLAN_SSID_MAXLEN + 1" (33).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6655/ioctl.c b/drivers/staging/vt6655/ioctl.c
index 2ae8116..46e0e41 100644
--- a/drivers/staging/vt6655/ioctl.c
+++ b/drivers/staging/vt6655/ioctl.c
@@ -64,7 +64,6 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 	PKnownBSS	pBSS;
 	PKnownNodeDB	pNode;
 	unsigned int	ii, jj;
-	SCmdLinkStatus	sLinkStatus;
 	unsigned char	abySuppRates[] = {WLAN_EID_SUPP_RATES, 4, 0x02, 0x04, 0x0B, 0x16};
 	unsigned char	abyNullAddr[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 	unsigned long	dwKeyIndex = 0;
@@ -245,10 +244,12 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 		pDevice->eEncryptionStatus = Ndis802_11Encryption1Enabled;
 		break;
 
-	case WLAN_CMD_GET_LINK:
+	case WLAN_CMD_GET_LINK: {
+		SCmdLinkStatus sLinkStatus;
+
 		DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "WLAN_CMD_GET_LINK status.\n");
 
-		memset(sLinkStatus.abySSID, 0 , WLAN_SSID_MAXLEN + 1);
+		memset(&sLinkStatus, 0, sizeof(sLinkStatus));
 
 		if (pMgmt->eCurrMode = WMAC_MODE_IBSS_STA)
 			sLinkStatus.wBSSType = ADHOC;
@@ -277,7 +278,7 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 			break;
 		}
 		break;
-
+	}
 	case WLAN_CMD_GET_LISTLEN:
 		cbListCount = 0;
 		pBSS = &(pMgmt->sBSSList[0]);
