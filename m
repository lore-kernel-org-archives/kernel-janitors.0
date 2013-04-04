From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2013 06:35:57 +0000
Subject: [patch 2/2] USB: keyspan: add a sanity test on "len"
Message-Id: <20130404063528.GD6494@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"len" comes from the USB transfer and it's probably correct.  The thing
is that we already have similar checks like:

	if (data[i] >= serial->num_ports) {

So adding a sanity test here matches the rest of the code and is a good
idea.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index c773ac7..84b5028 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -727,14 +727,15 @@ static void usa49wg_indat_callback(struct urb *urb)
 		if ((data[i] & 0x80) = 0) {
 			/* no error on any byte */
 			i++;
-			for (x = 1; x < len ; ++x)
+			for (x = 1; x < len && i < urb->actual_length; ++x)
 				tty_insert_flip_char(&port->port,
 						data[i++], 0);
 		} else {
 			/*
 			 * some bytes had errors, every byte has status
 			 */
-			for (x = 0; x + 1 < len; x += 2) {
+			for (x = 0; x + 1 < len &&
+				    i + 1 < urb->actual_length; x += 2) {
 				int stat = data[i], flag = 0;
 				if (stat & RXERROR_OVERRUN)
 					flag |= TTY_OVERRUN;
