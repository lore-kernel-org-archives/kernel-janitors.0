From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 22:44:18 +0000
Subject: [PATCH] USB: renesas_usbhs: fix spelling mistake "doens't" -> "doesn't"
Message-Id: <20190217224418.17163-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/renesas_usbhs/mod_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_usbhs/mod_host.c
index 4e59c649db81..ddd3be48f948 100644
--- a/drivers/usb/renesas_usbhs/mod_host.c
+++ b/drivers/usb/renesas_usbhs/mod_host.c
@@ -340,7 +340,7 @@ static void usbhsh_pipe_detach(struct usbhsh_hpriv *hpriv,
 	pipe = usbhsh_uep_to_pipe(uep);
 
 	if (unlikely(!pipe)) {
-		dev_err(dev, "uep doens't have pipe\n");
+		dev_err(dev, "uep doesn't have pipe\n");
 	} else if (1 = uep->counter--) { /* last user */
 		struct usb_host_endpoint *ep = usbhsh_uep_to_ep(uep);
 		struct usbhsh_device *udev = usbhsh_uep_to_udev(uep);
-- 
2.20.1
