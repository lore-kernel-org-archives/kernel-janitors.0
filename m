From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jan 2018 09:18:05 +0000
Subject: [PATCH][next] usbip: vhci: fix spelling mistake: "synchronuously" -> "synchronously"
Message-Id: <20180103091805.24064-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg debug message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/usbip/vhci_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index 112ebb90d8c9..44cd64518925 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -30,7 +30,7 @@ struct urb *pickup_urb_and_free_priv(struct vhci_device *vdev, __u32 seqnum)
 			/* fall through */
 		case -ECONNRESET:
 			dev_dbg(&urb->dev->dev,
-				 "urb seq# %u was unlinked %ssynchronuously\n",
+				 "urb seq# %u was unlinked %ssynchronously\n",
 				 seqnum, status = -ENOENT ? "" : "a");
 			break;
 		case -EINPROGRESS:
-- 
2.14.1

