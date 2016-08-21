From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 14:02:47 +0000
Subject: [PATCH 5/7] USB-iowarrior: Delete unnecessary initialisations in iowarrior_write()
Message-Id: <7dcaa032-41f8-49f2-13a7-e61ab50299d9@users.sourceforge.net>
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
Date: Sun, 21 Aug 2016 15:17:22 +0200

Two local variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/iowarrior.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index e3564d8..ffbbb74 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -338,8 +338,8 @@ static ssize_t iowarrior_write(struct file *file,
 			       size_t count, loff_t *ppos)
 {
 	struct iowarrior *dev;
-	int retval = 0;
-	char *buf = NULL;	/* for IOW24 and IOW56 we need a buffer */
+	int retval;
+	char *buf;	/* for IOW24 and IOW56 we need a buffer */
 	struct urb *int_out_urb = NULL;
 
 	dev = file->private_data;
-- 
2.9.3

