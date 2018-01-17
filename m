From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 10:45:19 +0000
Subject: [PATCH] input: cyapa: remove redundant assignment to 'pwr_cmd'
Message-Id: <20180117104519.19422-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable pwr_cmd is being assigned to cyapa->suspend_power_mode
twice, once during the declaration and once after taking an
interruptible mutex lock.  Remove the redundant first assignment
since the value is never read and it is outside the mutex lock.

Cleans up clang warning:
drivers/input/mouse/cyapa.c:743:5: warning: Value stored to 'pwr_cmd'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/cyapa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index fd8865c65caf..dfd3873513e4 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -740,7 +740,7 @@ static ssize_t cyapa_show_suspend_scanrate(struct device *dev,
 					   char *buf)
 {
 	struct cyapa *cyapa = dev_get_drvdata(dev);
-	u8 pwr_cmd = cyapa->suspend_power_mode;
+	u8 pwr_cmd;
 	u16 sleep_time;
 	int len;
 	int error;
-- 
2.15.1

