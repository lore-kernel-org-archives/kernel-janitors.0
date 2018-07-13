From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:51:51 +0000
Subject: [PATCH] usb: isp1760: remove redundant variable 'selector'
Message-Id: <20180713095151.22235-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'selector'  is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'selector' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/isp1760/isp1760-hcd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 1045521be293..8142c6b4c4cf 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1817,7 +1817,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 	u32 temp, status;
 	unsigned long flags;
 	int retval = 0;
-	unsigned selector;
 
 	/*
 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
@@ -2010,7 +2009,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
 		}
 		break;
 	case SetPortFeature:
-		selector = wIndex >> 8;
 		wIndex &= 0xff;
 		if (!wIndex || wIndex > ports)
 			goto error;
-- 
2.17.1

