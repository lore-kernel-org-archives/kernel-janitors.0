From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 22:12:29 +0000
Subject: [PATCH] leds: trigger: remove redundant assignment to variable ret
Message-Id: <20200420221229.99150-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/trigger/ledtrig-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 34a68604c46c..b4688d1d9d2b 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -28,7 +28,7 @@ static ssize_t led_delay_on_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
@@ -53,7 +53,7 @@ static ssize_t led_delay_off_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
-- 
2.25.1
