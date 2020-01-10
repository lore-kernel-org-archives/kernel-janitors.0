From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 10 Jan 2020 06:09:08 +0000
Subject: [PATCH net-next] sfc: remove set but not used variable 'nic_data'
Message-Id: <20200110060908.124241-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alex Maftei <amaftei@solarflare.com>, Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/sfc/mcdi_functions.c: In function 'efx_mcdi_ev_init':
drivers/net/ethernet/sfc/mcdi_functions.c:79:28: warning:
 variable 'nic_data' set but not used [-Wunused-but-set-variable]

commit 4438b587fe4b ("sfc: move MCDI event queue management code")
introduces this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/sfc/mcdi_functions.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/sfc/mcdi_functions.c b/drivers/net/ethernet/sfc/mcdi_functions.c
index f022e2b9e975..8cd9e0d76e85 100644
--- a/drivers/net/ethernet/sfc/mcdi_functions.c
+++ b/drivers/net/ethernet/sfc/mcdi_functions.c
@@ -76,13 +76,10 @@ int efx_mcdi_ev_init(struct efx_channel *channel, bool v1_cut_thru, bool v2)
 	MCDI_DECLARE_BUF(outbuf, MC_CMD_INIT_EVQ_V2_OUT_LEN);
 	size_t entries = channel->eventq.buf.len / EFX_BUF_SIZE;
 	struct efx_nic *efx = channel->efx;
-	struct efx_ef10_nic_data *nic_data;
 	size_t inlen, outlen;
 	dma_addr_t dma_addr;
 	int rc, i;
 
-	nic_data = efx->nic_data;
-
 	/* Fill event queue with all ones (i.e. empty events) */
 	memset(channel->eventq.buf.addr, 0xff, channel->eventq.buf.len);
