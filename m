From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Jan 2014 20:59:09 +0000
Subject: [patch] staging: vt6655: check too restrictive (off by one)
Message-Id: <20140103205909.GA9698@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Teodora Baluta <teobaluta@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

key_len = MAX_KEY_LEN is valid but we return an error.

Introduced-by: 6b7200fe0a59 ('Staging: vt6655: memory corruption in check in wpa_set_wpadev()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6655/wpactl.c b/drivers/staging/vt6655/wpactl.c
index ee83704e4401..d43efb85f4d3 100644
--- a/drivers/staging/vt6655/wpactl.c
+++ b/drivers/staging/vt6655/wpactl.c
@@ -202,8 +202,8 @@ int wpa_set_keys(PSDevice pDevice, void *ctx, bool fcpfkernel)
 	int uu, ii;
 
 	if (param->u.wpa_key.alg_name > WPA_ALG_CCMP ||
-	    param->u.wpa_key.key_len >= MAX_KEY_LEN ||
-	    param->u.wpa_key.seq_len >= MAX_KEY_LEN)
+	    param->u.wpa_key.key_len > MAX_KEY_LEN ||
+	    param->u.wpa_key.seq_len > MAX_KEY_LEN)
 		return -EINVAL;
 
 	DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "param->u.wpa_key.alg_name = %d \n", param->u.wpa_key.alg_name);
