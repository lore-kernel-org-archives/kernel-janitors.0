From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 23:39:55 +0000
Subject: [PATCH] USB: serial: cyberjack: fix spelling mistake "To" -> "Too"
Message-Id: <20200122233955.2829493-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/cyberjack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cyberjack.c b/drivers/usb/serial/cyberjack.c
index ebd76ab07b72..821970609695 100644
--- a/drivers/usb/serial/cyberjack.c
+++ b/drivers/usb/serial/cyberjack.c
@@ -276,7 +276,7 @@ static void cyberjack_read_int_callback(struct urb *urb)
 		old_rdtodo = priv->rdtodo;
 
 		if (old_rdtodo > SHRT_MAX - size) {
-			dev_dbg(dev, "To many bulk_in urbs to do.\n");
+			dev_dbg(dev, "Too many bulk_in urbs to do.\n");
 			spin_unlock_irqrestore(&priv->lock, flags);
 			goto resubmit;
 		}
-- 
2.24.0
