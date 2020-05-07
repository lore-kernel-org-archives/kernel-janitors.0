From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 15:06:52 +0000
Subject: [PATCH][next] staging: most: usb: sanity check channel before using it as an index into arrays
Message-Id: <20200507150652.52238-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently channel is being sanity checked after it has been used as
an index into some arrays. Fix this by moving the sanity check of
channel before the arrays are indexed with it.

Addresses-Coverity: ("Negative array index read")
Fixes: 59ed0480b950 ("Staging: most: replace pr_*() functions by dev_*()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/usb/usb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
index b31a49c37f7f..24ebd3071380 100644
--- a/drivers/staging/most/usb/usb.c
+++ b/drivers/staging/most/usb/usb.c
@@ -664,11 +664,6 @@ static int hdm_configure_channel(struct most_interface *iface, int channel,
 	struct most_dev *mdev = to_mdev(iface);
 	struct device *dev = &mdev->usb_device->dev;
 
-	mdev->is_channel_healthy[channel] = true;
-	mdev->clear_work[channel].channel = channel;
-	mdev->clear_work[channel].mdev = mdev;
-	INIT_WORK(&mdev->clear_work[channel].ws, wq_clear_halt);
-
 	if (!conf) {
 		dev_err(dev, "Bad config pointer.\n");
 		return -EINVAL;
@@ -677,6 +672,12 @@ static int hdm_configure_channel(struct most_interface *iface, int channel,
 		dev_err(dev, "Channel ID out of range.\n");
 		return -EINVAL;
 	}
+
+	mdev->is_channel_healthy[channel] = true;
+	mdev->clear_work[channel].channel = channel;
+	mdev->clear_work[channel].mdev = mdev;
+	INIT_WORK(&mdev->clear_work[channel].ws, wq_clear_halt);
+
 	if (!conf->num_buffers || !conf->buffer_size) {
 		dev_err(dev, "Misconfig: buffer size or #buffers zero.\n");
 		return -EINVAL;
-- 
2.25.1
