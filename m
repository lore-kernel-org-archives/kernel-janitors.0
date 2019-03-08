From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Mar 2019 10:30:17 +0000
Subject: [PATCH] media: em28xx-input: make const array addr_list static
Message-Id: <20190308103017.29114-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array addr_list on the stack but instead make it
static. Makes the object code smaller by 20 bytes

Before:
   text    data     bss     dec     hex filename^M
  16929    3626     384   20939    51cb ../usb/em28xx/em28xx-input.o

After:
   text    data     bss     dec     hex filename^M
  16829    3706     384   20919    51b7 ../usb/em28xx/em28xx-input.o

(gcc version 8.3.0, aarch64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/em28xx/em28xx-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index f84a1208d5d3..d85ea1af6aa1 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -499,7 +499,7 @@ static int em28xx_probe_i2c_ir(struct em28xx *dev)
 	 * at address 0x18, so if that address is needed for another board in
 	 * the future, please put it after 0x1f.
 	 */
-	const unsigned short addr_list[] = {
+	static const unsigned short addr_list[] = {
 		 0x1f, 0x30, 0x47, I2C_CLIENT_END
 	};
 
-- 
2.20.1
