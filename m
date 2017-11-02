From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 17:26:48 +0000
Subject: [PATCH] [media] au0828: make const array addr_list static
Message-Id: <20171102172648.13780-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate array addr_list on the stack but instead make it
static. Makes the object code smaller by over 360 bytes:

Before:
   text    data     bss     dec     hex filename
   8036    1488     192    9716    25f4 au0828-input.o

After:
   text    data     bss     dec     hex filename
   7696    1488     192    9376    24a0 au0828-input.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/au0828/au0828-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 7996eb83a54e..af68afe085b5 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -269,7 +269,7 @@ static void au0828_rc_stop(struct rc_dev *rc)
 static int au0828_probe_i2c_ir(struct au0828_dev *dev)
 {
 	int i = 0;
-	const unsigned short addr_list[] = {
+	static const unsigned short addr_list[] = {
 		 0x47, I2C_CLIENT_END
 	};
 
-- 
2.14.1

