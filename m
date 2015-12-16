From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2015 11:06:37 +0000
Subject: [patch] USB: ipaq.c: fix a timeout loop
Message-Id: <20151216110637.GA21018@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code expects the loop to end with "retries" set to zero but, because
it is a post-op, it will end set to -1.  I have fixed this by moving the
decrement inside the loop.

Fixes: 014aa2a3c32e ('USB: ipaq: minor ipaq_open() cleanup.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
index f51a5d5..ec1b8f2 100644
--- a/drivers/usb/serial/ipaq.c
+++ b/drivers/usb/serial/ipaq.c
@@ -531,7 +531,8 @@ static int ipaq_open(struct tty_struct *tty,
 	 * through. Since this has a reasonably high failure rate, we retry
 	 * several times.
 	 */
-	while (retries--) {
+	while (retries) {
+		retries--;
 		result = usb_control_msg(serial->dev,
 				usb_sndctrlpipe(serial->dev, 0), 0x22, 0x21,
 				0x1, 0, NULL, 0, 100);
