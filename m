From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Aug 2017 17:12:50 +0000
Subject: [PATCH] HID: hid-lg: make array cbuf static const to shink object code size
Message-Id: <20170825171250.23988-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate array cbuf on the stack, instead make it static.
Makes the object code smaller by over 110 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  15096	   3504	    128	  18728	   4928	drivers/hid/hid-lg.o

After:
   text	   data	    bss	    dec	    hex	filename
  14884	   3600	    128	  18612	   48b4	drivers/hid/hid-lg.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-lg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index 52026dc94d5c..596227ddb6e0 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -756,7 +756,9 @@ static int lg_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	/* Setup wireless link with Logitech Wii wheel */
 	if (hdev->product = USB_DEVICE_ID_LOGITECH_WII_WHEEL) {
-		const unsigned char cbuf[] = { 0x00, 0xAF,  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
+		static const unsigned char cbuf[] = {
+			0x00, 0xAF,  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+		};
 		u8 *buf = kmemdup(cbuf, sizeof(cbuf), GFP_KERNEL);
 
 		if (!buf) {
-- 
2.14.1

