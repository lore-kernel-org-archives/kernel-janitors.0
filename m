From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Nov 2017 17:40:15 +0000
Subject: [PATCH] USB: serial: iuu_phoenix: remove redundant assignment of DIV to itself
Message-Id: <20171120174015.7191-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of DIV to itself is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/iuu_phoenix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 397a8012ffa3..62c91e360baf 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -472,7 +472,6 @@ static int iuu_clk(struct usb_serial_port *port, int dwFrq)
 				}
 	}
 	P2 = ((P - PO) / 2) - 4;
-	DIV = DIV;
 	PUMP = 0x04;
 	PBmsb = (P2 >> 8 & 0x03);
 	PBlsb = P2 & 0xFF;
-- 
2.14.1

