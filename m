From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Oct 2011 06:10:39 +0000
Subject: [patch 2/2] Staging: vt6656: add some range checks before memcpy()
Message-Id: <20111020061039.GE6101@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to verify that we're not writing past the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6656/ioctl.c b/drivers/staging/vt6656/ioctl.c
index 2cde4f0c..4939002 100644
--- a/drivers/staging/vt6656/ioctl.c
+++ b/drivers/staging/vt6656/ioctl.c
@@ -81,6 +81,8 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 		}
 
 		pItemSSID = (PWLAN_IE_SSID)sScanCmd.ssid;
+		if (pItemSSID->len > WLAN_SSID_MAXLEN + 1)
+			return -EINVAL;
 		if (pItemSSID->len != 0) {
 			memset(abyScanSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
 			memcpy(abyScanSSID, pItemSSID, pItemSSID->len + WLAN_IEHDR_LEN);
@@ -155,6 +157,8 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 		}
 
 		pItemSSID = (PWLAN_IE_SSID)sJoinCmd.ssid;
+		if (pItemSSID->len > WLAN_SSID_MAXLEN + 1)
+			return -EINVAL;
 		memset(pMgmt->abyDesireSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
 		memcpy(pMgmt->abyDesireSSID, pItemSSID, pItemSSID->len + WLAN_IEHDR_LEN);
 		if (sJoinCmd.wBSSType = ADHOC) {
@@ -476,6 +480,8 @@ int private_ioctl(PSDevice pDevice, struct ifreq *rq)
 		}
 
 		pItemSSID = (PWLAN_IE_SSID)sStartAPCmd.ssid;
+		if (pItemSSID->len > WLAN_SSID_MAXLEN + 1)
+			return -EINVAL;
 		memset(pMgmt->abyDesireSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
 		memcpy(pMgmt->abyDesireSSID, pItemSSID, pItemSSID->len + WLAN_IEHDR_LEN);
 
