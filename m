From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 21:47:35 +0000
Subject: [PATCH] block/drbd: remove redundant initialization to variable rv
Message-Id: <20200507214735.66114-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rv is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/drbd/drbd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index c094c3c2c5d4..22dfaa91a89d 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -3522,7 +3522,7 @@ void drbd_uuid_set_bm(struct drbd_device *device, u64 val) __must_hold(local)
  */
 int drbd_bmio_set_n_write(struct drbd_device *device) __must_hold(local)
 {
-	int rv = -EIO;
+	int rv;
 
 	drbd_md_set_flag(device, MDF_FULL_SYNC);
 	drbd_md_sync(device);
-- 
2.25.1
