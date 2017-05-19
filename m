From: Colin King <colin.king@canonical.com>
Date: Fri, 19 May 2017 17:45:15 +0000
Subject: [PATCH][V2] [media] rainshadow-cec: ensure exit_loop is intialized
Message-Id: <20170519174515.6695-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

exit_loop is not being initialized, so it contains garbage. Ensure it is
initialized to false.

Detected by CoverityScan, CID#1436409 ("Uninitialized scalar variable")

Fixes: ea6a69defd3311 ("[media] rainshadow-cec: avoid -Wmaybe-uninitialized warning")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/rainshadow-cec/rainshadow-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c b/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
index 8d3ca2c8b20f..ad468efc4399 100644
--- a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
+++ b/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
@@ -119,7 +119,7 @@ static void rain_irq_work_handler(struct work_struct *work)
 
 	while (true) {
 		unsigned long flags;
-		bool exit_loop;
+		bool exit_loop = false;
 		char data;
 
 		spin_lock_irqsave(&rain->buf_lock, flags);
-- 
2.11.0

