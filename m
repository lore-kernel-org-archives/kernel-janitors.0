From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Oct 2017 00:28:45 +0000
Subject: [PATCH] drm/panel: rpi-touchscreen: propagate errors in rpi_touchscreen_i2c_read()
Message-Id: <20171020002845.kar2wg7gqxg7tzqi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There is one caller which checks whether rpi_touchscreen_i2c_read()
returns negative error codes.  Currently it can't because negative
error codes are truncated to u8, but that's easy to fix if we change the
type to int.

Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" Touchscreen.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 890fd6ff397c..d964d454e4ae 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -221,7 +221,7 @@ static struct rpi_touchscreen *panel_to_ts(struct drm_panel *panel)
 	return container_of(panel, struct rpi_touchscreen, base);
 }
 
-static u8 rpi_touchscreen_i2c_read(struct rpi_touchscreen *ts, u8 reg)
+static int rpi_touchscreen_i2c_read(struct rpi_touchscreen *ts, u8 reg)
 {
 	return i2c_smbus_read_byte_data(ts->i2c, reg);
 }
