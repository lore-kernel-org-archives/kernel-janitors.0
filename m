From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Dec 2015 13:19:49 +0000
Subject: [patch] prism54: off by one BUG_ON() test
Message-Id: <20151204131949.GF12792@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This code was supposed to trigger a BUG() if we truncate the output but
it's off by one so it allows one character to be truncated.  Really
drivers shouldn't call BUG_ON() and especially for something minor like
this so I've changed it to a WARN_ON().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/intersil/prism54/isl_ioctl.c b/drivers/net/wireless/intersil/prism54/isl_ioctl.c
index ecbb054..48e8a97 100644
--- a/drivers/net/wireless/intersil/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/intersil/prism54/isl_ioctl.c
@@ -2036,7 +2036,7 @@ format_event(islpci_private *priv, char *dest, const char *str,
 			 mlme->address,
 			 (error ? (mlme->code ? " : REJECTED " : " : ACCEPTED ")
 			  : ""), mlme->code);
-	BUG_ON(n > IW_CUSTOM_MAX);
+	WARN_ON(n >= IW_CUSTOM_MAX);
 	*length = n;
 }
 
