From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 09:07:43 +0000
Subject: [PATCH] HID: fix typo in Kconfig
Message-Id: <20200412090743.8236-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Fix 2 typos:
   s/Uninterruptable/Uninterruptible/
   s/should't/shouldn't/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c5b0bd5283fa..008bf44bc2c3 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -42,7 +42,7 @@ config HIDRAW
 	---help---
 	Say Y here if you want to support HID devices (from the USB
 	specification standpoint) that aren't strictly user interface
-	devices, like monitor controls and Uninterruptable Power Supplies.
+	devices, like monitor controls and Uninterruptible Power Supplies.
 
 	This module supports these devices separately using a separate
 	event interface on /dev/hidraw.
@@ -1140,7 +1140,7 @@ config HID_SENSOR_CUSTOM_SENSOR
 	  to decide how to interpret these special sensor ids and process in
 	  the user space. Currently some manufacturers are using these ids for
 	  sensor calibration and debugging other sensors. Manufacturers
-	  should't use these special custom sensor ids to export any of the
+	  shouldn't use these special custom sensor ids to export any of the
 	  standard sensors.
 	  Select this config option for custom/generic sensor support.
 
-- 
2.20.1
