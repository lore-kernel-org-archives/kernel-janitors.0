From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Sep 2018 23:04:08 +0000
Subject: [PATCH] USB: serial: cypress_m8: fix spelling mistake "retreiving" -> "retrieving"
Message-Id: <20180923230408.8721-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/cypress_m8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index e0035c023120..31c6091be46a 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -378,7 +378,7 @@ static int cypress_serial_control(struct tty_struct *tty,
 			retval = -ENOTTY;
 			goto out;
 		}
-		dev_dbg(dev, "%s - retreiving serial line settings\n", __func__);
+		dev_dbg(dev, "%s - retrieving serial line settings\n", __func__);
 		do {
 			retval = usb_control_msg(port->serial->dev,
 					usb_rcvctrlpipe(port->serial->dev, 0),
-- 
2.17.1
