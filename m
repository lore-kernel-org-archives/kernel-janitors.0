From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 08:01:22 +0000
Subject: [PATCH] net: sfc: remove redundant variable start
Message-Id: <20171109080122.3254-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable start is assigned but never read hence it is redundant
and can be removed. Cleans up clang warning:

drivers/net/ethernet/sfc/ptp.c:655:2: warning: Value stored to 'start'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sfc/ptp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
index 56c2db398def..caa89bf7603e 100644
--- a/drivers/net/ethernet/sfc/ptp.c
+++ b/drivers/net/ethernet/sfc/ptp.c
@@ -648,11 +648,9 @@ static void efx_ptp_send_times(struct efx_nic *efx,
 	struct pps_event_time now;
 	struct timespec64 limit;
 	struct efx_ptp_data *ptp = efx->ptp_data;
-	struct timespec64 start;
 	int *mc_running = ptp->start.addr;
 
 	pps_get_ts(&now);
-	start = now.ts_real;
 	limit = now.ts_real;
 	timespec64_add_ns(&limit, SYNCHRONISE_PERIOD_NS);
 
-- 
2.14.1

