From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 13:03:58 +0000
Subject: [PATCH][next] staging: comedi: usbdux: remove redundant initialization of fx2delay
Message-Id: <20190617130358.28749-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable fx2delay is being initialized to a value that is never read
and is being re-assigned a few statements later. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/usbdux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index b8f54b7fb34a..0350f303d557 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -1226,7 +1226,7 @@ static int usbdux_pwm_period(struct comedi_device *dev,
 			     unsigned int period)
 {
 	struct usbdux_private *devpriv = dev->private;
-	int fx2delay = 255;
+	int fx2delay;
 
 	if (period < MIN_PWM_PERIOD)
 		return -EAGAIN;
-- 
2.20.1
