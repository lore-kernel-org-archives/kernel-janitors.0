From: Christopher Diaz Riveros <chrisadr@gentoo.org>
Date: Tue, 20 Feb 2018 16:33:54 +0000
Subject: [PATCH-next] staging: rtl8723bs: Remove unneeded cast
Message-Id: <20180220163354.14418-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, hadess@hadess.net, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix Coccinelle alert:

drivers/staging//rtl8723bs/os_dep/sdio_intf.c:340:13-27: WARNING: casting value returned by memory allocation function to (struct adapter *) is useless.

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher Diaz Riveros <chrisadr@gentoo.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 943324877707..99c407ba0874 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -337,7 +337,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	struct adapter *padapter = NULL;
 	PSDIO_DATA psdio = &dvobj->intf_data;
 
-	padapter = (struct adapter *)vzalloc(sizeof(*padapter));
+	padapter = vzalloc(sizeof(*padapter));
 	if (padapter = NULL) {
 		goto exit;
 	}
-- 
2.16.2

