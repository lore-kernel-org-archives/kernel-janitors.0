From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 14:30:14 +0000
Subject: [PATCH] pktcdvd: remove redundant initialization of variable ret
Message-Id: <20200611143014.925317-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/pktcdvd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 0b944ac96d6b..27a33adc41e4 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -1613,7 +1613,7 @@ static noinline_for_stack int pkt_get_last_written(struct pktcdvd_device *pd,
 	disc_information di;
 	track_information ti;
 	__u32 last_track;
-	int ret = -1;
+	int ret;
 
 	ret = pkt_get_disc_info(pd, &di);
 	if (ret)
-- 
2.27.0.rc0
