From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 11:45:27 +0000
Subject: [PATCH] USB: adutux: remove redundant variable minor
Message-Id: <20171107114527.22979-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable minor is being assigned but never read, hence it is redundant
and can be removed. Cleans up clang warning:

drivers/usb/misc/adutux.c:770:2: warning: Value stored to 'minor' is
never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/adutux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index e9195a7103a8..4b8712733fc7 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -757,13 +757,11 @@ static int adu_probe(struct usb_interface *interface,
 static void adu_disconnect(struct usb_interface *interface)
 {
 	struct adu_device *dev;
-	int minor;
 
 	dev = usb_get_intfdata(interface);
 
 	mutex_lock(&dev->mtx);	/* not interruptible */
 	dev->udev = NULL;	/* poison */
-	minor = dev->minor;
 	usb_deregister_dev(interface, &adu_class);
 	mutex_unlock(&dev->mtx);
 
-- 
2.14.1

