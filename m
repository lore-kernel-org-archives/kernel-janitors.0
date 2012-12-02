From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun, 02 Dec 2012 02:40:22 +0000
Subject: [PATCH 6/6] vt6656: remove a useless call to memset().
Message-Id: <1354416022-20189-7-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, forest@alittletooquiet.net, gregkh@linuxfoundation.org, tvboxspy@gmail.com, marcos.souza.org@gmail.com, standby24x7@gmail.com, justinmattock@gmail.com, devel@driverdev.osuosl.org

This call is followed by a call to memcpy() on the same memory area, so it can
be safely removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/vt6656/bssdb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6656/bssdb.c b/drivers/staging/vt6656/bssdb.c
index 6a13941..f9098b8 100644
--- a/drivers/staging/vt6656/bssdb.c
+++ b/drivers/staging/vt6656/bssdb.c
@@ -240,7 +240,6 @@ pDevice->bSameBSSMaxNum = jj;
             pSelect->bSelected = TRUE;
                         if (pDevice->bRoaming = FALSE)  {
 	//       Einsn Add @20070907
-				memset(pbyDesireSSID, 0, WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1);
 			memcpy(pbyDesireSSID,pCurrBSS->abySSID,WLAN_IEHDR_LEN + WLAN_SSID_MAXLEN + 1) ;
                                                 }
 
-- 
1.7.10.4

