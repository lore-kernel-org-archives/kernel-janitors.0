From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Nov 2014 12:48:01 +0000
Subject: [patch] usb: storage: debug: uninitialized var in usb_stor_show_sense()
Message-Id: <20141129124801.GA27251@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Dharm <mdharm-usb@one-eyed-alien.net>, Hannes Reinecke <hare@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, =?iso-8859-1?Q?J=F6rn?= Engel <joern@purestorage.com>

The "fmt" variable might be used uninitialized, it should be set to NULL
at the start.

Fixes: d811b848ebb7 ('scsi: use sdev as argument for sense code printing')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/storage/debug.c b/drivers/usb/storage/debug.c
index 57bf3ad..fd00509 100644
--- a/drivers/usb/storage/debug.c
+++ b/drivers/usb/storage/debug.c
@@ -164,7 +164,8 @@ void usb_stor_show_sense(const struct us_data *us,
 			 unsigned char asc,
 			 unsigned char ascq)
 {
-	const char *what, *keystr, *fmt;
+	const char *fmt = NULL;
+	const char *what, *keystr;
 
 	keystr = scsi_sense_key_string(key);
 	what = scsi_extd_sense_format(asc, ascq, &fmt);
