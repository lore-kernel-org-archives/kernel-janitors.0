From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Nov 2019 22:33:02 +0000
Subject: [PATCH] nbd: fix spelling mistake "requeueing" -> "requeuing"
Message-Id: <20191107223302.416745-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a94ee45440b3..aca67f8b48d1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -936,7 +936,7 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	ret = nbd_send_cmd(nbd, cmd, index);
 	if (ret = -EAGAIN) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
-				    "Request send failed, requeueing\n");
+				    "Request send failed, requeuing\n");
 		nbd_mark_nsock_dead(nbd, nsock, 1);
 		nbd_requeue_cmd(cmd);
 		ret = 0;
-- 
2.20.1
