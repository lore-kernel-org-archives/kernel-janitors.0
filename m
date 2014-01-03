From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Jan 2014 20:59:41 +0000
Subject: [patch] staging: vt6656: remove an unneeded NULL check
Message-Id: <20140103205941.GB9698@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "param->u.wpa_key.key" on the next line so the check
here is inconsistent.  This is only called from iwctl_siwencodeext() and
"param->u.wpa_key.key" is a valid pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6656/wpactl.c b/drivers/staging/vt6656/wpactl.c
index 003bd7c614e5..f4a8a5cb9feb 100644
--- a/drivers/staging/vt6656/wpactl.c
+++ b/drivers/staging/vt6656/wpactl.c
@@ -86,7 +86,7 @@ int wpa_set_keys(struct vnt_private *pDevice, void *ctx)
 		return ret;
 	}
 
-	if (param->u.wpa_key.key && param->u.wpa_key.key_len > sizeof(abyKey))
+	if (param->u.wpa_key.key_len > sizeof(abyKey))
 		return -EINVAL;
 
 	memcpy(&abyKey[0], param->u.wpa_key.key, param->u.wpa_key.key_len);
