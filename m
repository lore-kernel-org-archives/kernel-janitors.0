From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:00 +0000
Subject: [PATCH 17/25] wrap_sec: remove casts from void*
Message-Id: <1277806561-31282-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alexander Beregalov <a.beregalov@gmail.com>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/otus/wrap_sec.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/otus/wrap_sec.c b/drivers/staging/otus/wrap_sec.c
index 0b238e9..1fba7a9 100644
--- a/drivers/staging/otus/wrap_sec.c
+++ b/drivers/staging/otus/wrap_sec.c
@@ -36,7 +36,7 @@ extern int zfLnxCencSendMsg(struct sock *netlink_sk, u_int8_t *msg, int len);
 u16_t zfLnxCencAsocNotify(zdev_t *dev, u16_t *macAddr, u8_t *body,
 				u16_t bodySize, u16_t port)
 {
-	struct usbdrv_private *macp = (struct usbdrv_private *)dev->priv;
+	struct usbdrv_private *macp = dev->priv;
 	struct zydas_cenc_sta_info cenc_info;
 	/* struct sock *netlink_sk;	*/
 	u8_t ie_len;
-- 
1.7.0.4

