From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Thu, 31 Mar 2016 22:53:14 +0000
Subject: [PATCH] staging: vme: fix bare use of 'unsigned'
Message-Id: <1459464794-27986-1-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martyn@welchs.me.uk, manohar.vanga@gmail.com, gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Prefer 'unsigned int' to bare use of
'unsigned''

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/vme/devices/vme_pio2_gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme/devices/vme_pio2_gpio.c b/drivers/staging/vme/devices/vme_pio2_gpio.c
index df992c3..f52a9ed 100644
--- a/drivers/staging/vme/devices/vme_pio2_gpio.c
+++ b/drivers/staging/vme/devices/vme_pio2_gpio.c
@@ -97,7 +97,7 @@ static void pio2_gpio_set(struct gpio_chip *chip,
 }
 
 /* Directionality configured at board build - send appropriate response */
-static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
+static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
 {
 	int data;
 	struct pio2_card *card = gpio_to_pio2_card(chip);
@@ -116,7 +116,8 @@ static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 }
 
 /* Directionality configured at board build - send appropriate response */
-static int pio2_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int value)
+static int pio2_gpio_dir_out(struct gpio_chip *chip,
+			     unsigned int offset, int value)
 {
 	int data;
 	struct pio2_card *card = gpio_to_pio2_card(chip);
-- 
1.9.1

