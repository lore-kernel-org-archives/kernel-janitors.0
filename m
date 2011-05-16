From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 May 2011 12:24:57 +0000
Subject: [PATCH] drivers/staging/line6/driver.c: Drop unneeded put functions.
Message-Id: <1305548697-27591-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Markus Grabner <grabner@icg.tugraz.at>, Kulikov Vasiliy <segooon@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

This seems to be the result of patches ab366c1a and 1027f476 crossing each
other.  Patch ab366c1a adds calls to usb_put_intf and usb_put_dev at the
end of the function line6_probe, in the error handling code, while patch
1027f476 moves the calls to the corresponding get function from the
beginning to the end of line6_probe, making the calls to put in the error
handling code unnecessary.

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/line6/driver.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/line6/driver.c b/drivers/staging/line6/driver.c
index ea9209d..851b762 100644
--- a/drivers/staging/line6/driver.c
+++ b/drivers/staging/line6/driver.c
@@ -1094,8 +1094,6 @@ static int line6_probe(struct usb_interface *interface,
 err_destruct:
 	line6_destruct(interface);
 err_put:
-	usb_put_intf(interface);
-	usb_put_dev(usbdev);
 	return ret;
 }
 

