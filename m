From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Sep 2011 06:13:18 +0000
Subject: [patch] Staging: vt6656: potential memory corruption
Message-Id: <20110929061318.GD4104@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

param->u.wpa_key.key_len comes from the user.  If it's too large we
would write past the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6656/wpactl.c b/drivers/staging/vt6656/wpactl.c
index 9216df0..2fa4f84 100644
--- a/drivers/staging/vt6656/wpactl.c
+++ b/drivers/staging/vt6656/wpactl.c
@@ -229,6 +229,9 @@ int wpa_set_wpadev(PSDevice pDevice, int val)
         return ret;
     }
 
+	if (param->u.wpa_key.key && param->u.wpa_key.key_len > sizeof(abyKey))
+		return -EINVAL;
+
     spin_unlock_irq(&pDevice->lock);
     if(param->u.wpa_key.key && fcpfkernel) {
        memcpy(&abyKey[0], param->u.wpa_key.key, param->u.wpa_key.key_len);
@@ -269,6 +272,10 @@ int wpa_set_wpadev(PSDevice pDevice, int val)
         return ret;
 	}
 
+
+	if (param->u.wpa_key.seq && param->u.wpa_key.seq_len > sizeof(abySeq))
+		return -EINVAL;
+
     spin_unlock_irq(&pDevice->lock);
         if(param->u.wpa_key.seq && fcpfkernel) {
            memcpy(&abySeq[0], param->u.wpa_key.seq, param->u.wpa_key.seq_len);
@@ -772,9 +779,14 @@ static int wpa_set_associate(PSDevice pDevice,
     DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "wpa_ie_len = %d\n", param->u.wpa_associate.wpa_ie_len);
     DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "Roaming dBm = %d\n", param->u.wpa_associate.roam_dbm);  //Davidwang
 
-	if (param->u.wpa_associate.wpa_ie &&
-	    copy_from_user(&abyWPAIE[0], param->u.wpa_associate.wpa_ie, param->u.wpa_associate.wpa_ie_len))
-	    return -EINVAL;
+	if (param->u.wpa_associate.wpa_ie) {
+		if (param->u.wpa_associate.wpa_ie_len > sizeof(abyWPAIE))
+			return -EINVAL;
+
+		if (copy_from_user(&abyWPAIE[0], param->u.wpa_associate.wpa_ie,
+					param->u.wpa_associate.wpa_ie_len))
+			return -EFAULT;
+	}
 
 	if (param->u.wpa_associate.mode = 1)
 	    pMgmt->eConfigMode = WMAC_CONFIG_IBSS_STA;
