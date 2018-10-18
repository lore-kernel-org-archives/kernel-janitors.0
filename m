From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 08:04:00 +0000
Subject: [PATCH 1/2] usb: phy: ab8500: silence some uninitialized variable warnings
Message-Id: <20181018080400.2ffpzzyy6svvppzb@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "reg" can be uninitialized if the
abx500_get_register_interruptible() call fails.  It's an interruptable
function, so we should check if the user presses CTRL-C.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/phy/phy-ab8500-usb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 66143ab8c043..aaf363f19714 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -505,15 +505,19 @@ static int abx500_usb_link_status_update(struct ab8500_usb *ab)
 	if (is_ab8500(ab->ab8500)) {
 		enum ab8500_usb_link_status lsts;
 
-		abx500_get_register_interruptible(ab->dev,
+		ret = abx500_get_register_interruptible(ab->dev,
 				AB8500_USB, AB8500_USB_LINE_STAT_REG, &reg);
+		if (ret < 0)
+			return ret;
 		lsts = (reg >> 3) & 0x0F;
 		ret = ab8500_usb_link_status_update(ab, lsts);
 	} else if (is_ab8505(ab->ab8500)) {
 		enum ab8505_usb_link_status lsts;
 
-		abx500_get_register_interruptible(ab->dev,
+		ret = abx500_get_register_interruptible(ab->dev,
 				AB8500_USB, AB8505_USB_LINE_STAT_REG, &reg);
+		if (ret < 0)
+			return ret;
 		lsts = (reg >> 3) & 0x1F;
 		ret = ab8505_usb_link_status_update(ab, lsts);
 	}
-- 
2.11.0
