From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 26 Oct 2019 02:07:38 +0000
Subject: [PATCH -next] net: aquantia: make two symbols be static
Message-Id: <20191026020738.130606-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: epomozov@marvell.com, igor.russkikh@aquantia.com, davem@davemloft.net, pavel.belous@aquantia.com, dmitry.bezrukov@aquantia.com, dmitry.bogdanov@aquantia.com, ndanilov@aquantia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

When using ARCH=mips CROSS_COMPILE=mips-linux-gnu-
to build drivers/net/ethernet/aquantia/atlantic/aq_ptp.o
and drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.o,
below errors can be seen:
drivers/net/ethernet/aquantia/atlantic/aq_ptp.c:1378:6:
warning: symbol 'aq_ptp_poll_sync_work_cb' was not declared.
Should it be static?

drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c:1155:5:
warning: symbol 'hw_atl_b0_ts_to_sys_clock' was not declared.
Should it be static?

This patch to make aq_ptp_poll_sync_work_cb and hw_atl_b0_ts_to_sys_clock
be static to fix these warnings.

Fixes: 9c477032f7d0 ("net: aquantia: add support for PIN funcs")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c           | 2 +-
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 3ec0841..d92d119 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -1375,7 +1375,7 @@ static int aq_ptp_check_sync1588(struct aq_ptp_s *aq_ptp)
 	return 0;
 }
 
-void aq_ptp_poll_sync_work_cb(struct work_struct *w)
+static void aq_ptp_poll_sync_work_cb(struct work_struct *w)
 {
 	struct delayed_work *dw = to_delayed_work(w);
 	struct aq_ptp_s *aq_ptp = container_of(dw, struct aq_ptp_s, poll_sync);
diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c
index 51ecf87..8f866c7 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c
@@ -1152,7 +1152,7 @@ static int hw_atl_b0_set_sys_clock(struct aq_hw_s *self, u64 time, u64 ts)
 	return hw_atl_b0_adj_sys_clock(self, delta);
 }
 
-int hw_atl_b0_ts_to_sys_clock(struct aq_hw_s *self, u64 ts, u64 *time)
+static int hw_atl_b0_ts_to_sys_clock(struct aq_hw_s *self, u64 ts, u64 *time)
 {
 	*time = self->ptp_clk_offset + ts;
 	return 0;
-- 
2.7.4
