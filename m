From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 13:56:56 +0000
Subject: [PATCH 2/7] USB-iowarrior: Delete unnecessary initialisations for the variable "dev"
Message-Id: <132bad2f-c594-4feb-f989-d41ee124d5ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
In-Reply-To: <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Boyer <jwboyer@fedoraproject.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 13:26:09 +0200

The local variable "dev" was initialised despite of the detail
that it was immediately reassigned by the following statement.
Thus remove such unnecessary specifications.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/iowarrior.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 8ae01b0..6048f97 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -468,7 +468,7 @@ exit:
 static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 							unsigned long arg)
 {
-	struct iowarrior *dev = NULL;
+	struct iowarrior *dev;
 	__u8 *buffer;
 	__u8 __user *user_buffer;
 	int retval;
@@ -751,7 +751,7 @@ static int iowarrior_probe(struct usb_interface *interface,
 			   const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct iowarrior *dev = NULL;
+	struct iowarrior *dev;
 	struct usb_host_interface *iface_desc;
 	struct usb_endpoint_descriptor *endpoint;
 	int i;
-- 
2.9.3

