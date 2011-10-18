From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:27:25 +0000
Subject: [patch] Staging: vt6655: memory corruption in check in
Message-Id: <20111018062725.GP27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code left it up to the user to decide how much data to
copy, but that doesn't work with a fixed size array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6655/wpactl.c b/drivers/staging/vt6655/wpactl.c
index a0f994e..732ba88 100644
--- a/drivers/staging/vt6655/wpactl.c
+++ b/drivers/staging/vt6655/wpactl.c
@@ -213,7 +213,9 @@ int wpa_set_wpadev(PSDevice pDevice, int val)
 	int uu, ii;
 
 
-	if (param->u.wpa_key.alg_name > WPA_ALG_CCMP)
+	if (param->u.wpa_key.alg_name > WPA_ALG_CCMP ||
+			param->u.wpa_key.key_len >= MAX_KEY_LEN ||
+			param->u.wpa_key.seq_len >= MAX_KEY_LEN)
 		return -EINVAL;
 
     DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "param->u.wpa_key.alg_name = %d \n", param->u.wpa_key.alg_name);
