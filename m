From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 12 Jul 2010 14:48:46 +0000
Subject: [PATCH] staging: usbip: fix memory leak
Message-Id: <1278946126-30353-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Tejun Heo <tj@kernel.org>, "Brian G. Merrell" <bgmerrell@novell.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

sdev should be freed if stub_add_files() failed.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/usbip/stub_dev.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index 3f95605..1f40851 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -438,6 +438,8 @@ static int stub_probe(struct usb_interface *interface,
 	if (err) {
 		dev_err(&interface->dev, "create sysfs files for %s\n",
 			udev_busid);
+		usb_set_intfdata(interface, 0);
+		stub_device_free(sdev);
 		return err;
 	}
 
-- 
1.7.0.4

