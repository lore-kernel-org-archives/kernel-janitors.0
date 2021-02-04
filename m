From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 17:27:48 +0000
Subject: [PATCH] HID: lg-g15: make a const array static, makes object smaller
Message-Id: <20210204172748.107406-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array led_names on the stack but instead make
it static. Makes the object code smaller by 79 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  19686	   7952	    256	  27894	   6cf6	drivers/hid/hid-lg-g15.o

After:
   text	   data	    bss	    dec	    hex	filename
  19543	   8016	    256	  27815	   6ca7	drivers/hid/hid-lg-g15.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-lg-g15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index fcaf8466e627..bfbba0d41933 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -647,7 +647,7 @@ static void lg_g15_input_close(struct input_dev *dev)
 
 static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 {
-	const char * const led_names[] = {
+	static const char * const led_names[] = {
 		"g15::kbd_backlight",
 		"g15::lcd_backlight",
 		"g15::macro_preset1",
-- 
2.29.2
