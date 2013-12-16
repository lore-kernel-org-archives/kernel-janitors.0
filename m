From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:23:33 +0000
Subject: [PATCH 5/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172333.GF15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


drivers/net/ethernet/chelsio/cxgb/cxgb2.c
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: x86_64_defconfig with the following addition
        Device Drivers  --->
          [*] Network device support  --->
            [*]   Ethernet driver support  --->
              <M>     Chelsio 10Gb Ethernet support
toolchain: debian wheezy default x86_64-linux-gnu 4.4.5

Builds xcgb2.o without warnings.
no runtime testing (no hardware available)

CC: Dimitrios Michailidis <dm@chelsio.com>
CC: maintainers@chelsio.com
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
index e598713..e4a1bfe 100644
--- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
+++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
@@ -283,8 +283,8 @@ static int cxgb_close(struct net_device *dev)
 	    !(adapter->open_device_map & PORT_MASK)) {
 		/* Stop statistics accumulation. */
 		smp_mb__after_clear_bit();
-		spin_lock(&adapter->work_lock);   /* sync with update task */
-		spin_unlock(&adapter->work_lock);
+		/* sync with update task */
+		spin_unlock_wait(&adapter->work_lock);
 		cancel_mac_stats_update(adapter);
 	}
 
-- 
1.7.2.5

