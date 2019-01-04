From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Jan 2019 17:59:41 +0000
Subject: [PATCH] USB: musb: fix indentation issue on a return statement
Message-Id: <20190104175941.9669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statement is indented one level too far, fix this by removing
a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/musb/musb_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index b59ce9ad14ce..0b1eb15b6b08 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1283,7 +1283,7 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 					MUSB_TXCSR_H_WZC_BITS
 					| MUSB_TXCSR_TXPKTRDY);
 		}
-			return;
+		return;
 	}
 
 done:
-- 
2.19.1
