From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 14:32:38 +0000
Subject: [PATCH 0/4] staging-greybus: Fine-tuning for four functions
Message-Id: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Dec 2016 15:25:35 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  One function call less in gb_camera_configure_streams() after error detection
  light: Use kcalloc() in two functions
  Check return value of a kstrndup() call in gb_lights_light_config()
  Use kcalloc() in gb_power_supplies_setup()

 drivers/staging/greybus/camera.c       | 16 +++++++++-------
 drivers/staging/greybus/light.c        | 12 ++++++++----
 drivers/staging/greybus/power_supply.c |  7 +++----
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.11.0

