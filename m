From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 14:00:11 +0000
Subject: [PATCH 4/7] USB-iowarrior: Delete unnecessary initialisations in iowarrior_open()
Message-Id: <acffa0dc-e51e-b042-21b8-1961dc37832f@users.sourceforge.net>
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
Date: Sun, 21 Aug 2016 15:15:03 +0200

Two local variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/iowarrior.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 449bf64..e3564d8 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -587,10 +587,10 @@ error_out:
  */
 static int iowarrior_open(struct inode *inode, struct file *file)
 {
-	struct iowarrior *dev = NULL;
+	struct iowarrior *dev;
 	struct usb_interface *interface;
 	int subminor;
-	int retval = 0;
+	int retval;
 
 	mutex_lock(&iowarrior_mutex);
 	subminor = iminor(inode);
-- 
2.9.3

