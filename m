From: Dan Carpenter <error27@gmail.com>
Date: Mon, 06 Sep 2010 12:32:30 +0000
Subject: [patch] Staging: vt6655: buffer overflow
Message-Id: <20100906123230.GB2764@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"param->u.wpa_associate.wpa_ie_len" comes from the user.  We should
check it so that the copy_from_user() doesn't overflow the buffer.

Also further down in the function, we assume that if
"param->u.wpa_associate.wpa_ie_len" is set then "abyWPAIE[0]" is
initialized.  To make that work, I changed the test here to say that if
"wpa_ie_len" is set then "wpa_ie" has to be a valid pointer or we return
-EINVAL.

Oddly, we only use the first element of the abyWPAIE[] array.  So I
suspect there may be some other issues in this function.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/vt6655/wpactl.c b/drivers/staging/vt6655/wpactl.c
index 0142338..4bdb836 100644
--- a/drivers/staging/vt6655/wpactl.c
+++ b/drivers/staging/vt6655/wpactl.c
@@ -766,9 +766,14 @@ static int wpa_set_associate(PSDevice pDevice,
     DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "wpa_ie_len = %d\n", param->u.wpa_associate.wpa_ie_len);
 
 
-	if (param->u.wpa_associate.wpa_ie &&
-	    copy_from_user(&abyWPAIE[0], param->u.wpa_associate.wpa_ie, param->u.wpa_associate.wpa_ie_len))
-	    return -EINVAL;
+	if (param->u.wpa_associate.wpa_ie_len) {
+		if (!param->u.wpa_associate.wpa_ie)
+			return -EINVAL;
+		if (param->u.wpa_associate.wpa_ie_len > sizeof(abyWPAIE))
+			return -EINVAL;
+		if (copy_from_user(&abyWPAIE[0], param->u.wpa_associate.wpa_ie, param->u.wpa_associate.wpa_ie_len))
+			return -EFAULT;
+	}
 
 	if (param->u.wpa_associate.mode = 1)
 	    pMgmt->eConfigMode = WMAC_CONFIG_IBSS_STA;
