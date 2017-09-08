From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Sep 2017 15:24:52 +0000
Subject: [PATCH] rsi: fix a dereference on adapter before it has been null checked
Message-Id: <20170908152452.3594-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of dev is dereferencing adapter before adapter has
been null checked, potentially leading to a null pointer dereference.
Fix this by simply moving the assignment of dev to a later point
after the sanity null check of adapter.

Detected by CoverityScan CID#1398383 ("Dereference before null check")

Fixes: dad0d04fa7ba ("rsi: Add RS9113 wireless driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_usb.c b/drivers/net/wireless/rsi/rsi_91x_usb.c
index 81df09dd2636..08730227cd18 100644
--- a/drivers/net/wireless/rsi/rsi_91x_usb.c
+++ b/drivers/net/wireless/rsi/rsi_91x_usb.c
@@ -73,8 +73,7 @@ static int rsi_write_multiple(struct rsi_hw *adapter,
 			      u8 *data,
 			      u32 count)
 {
-	struct rsi_91x_usbdev *dev -		(struct rsi_91x_usbdev *)adapter->rsi_dev;
+	struct rsi_91x_usbdev *dev;
 
 	if (!adapter)
 		return -ENODEV;
@@ -82,6 +81,7 @@ static int rsi_write_multiple(struct rsi_hw *adapter,
 	if (endpoint = 0)
 		return -EINVAL;
 
+	dev = (struct rsi_91x_usbdev *)adapter->rsi_dev;
 	if (dev->write_fail)
 		return -ENETDOWN;
 
-- 
2.14.1

