From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 08:25:54 +0000
Subject: [PATCH] staging: rtl8712: remove redundant assignment to variable res
Message-Id: <20190705082554.15588-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable res is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 307b0e292976..dac79e6dcdcb 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -739,7 +739,7 @@ static void dump_xframe(struct _adapter *padapter,
 
 int r8712_xmit_direct(struct _adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	int res = _SUCCESS;
+	int res;
 
 	res = r8712_xmitframe_coalesce(padapter, pxmitframe->pkt, pxmitframe);
 	pxmitframe->pkt = NULL;
-- 
2.20.1
