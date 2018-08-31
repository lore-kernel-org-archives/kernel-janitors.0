From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 31 Aug 2018 11:53:56 +0000
Subject: [PATCH net-next] liquidio: cHECK-remove set but not used variable 'irh'
Message-Id: <1535716436-87194-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5eb803ef-3c23-0b58-e8bc-3f40b3fb5a78@huawei.com>
In-Reply-To: <5eb803ef-3c23-0b58-e8bc-3f40b3fb5a78@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/cavium/liquidio/request_manager.c: In function 'lio_process_iq_request_list':
drivers/net/ethernet/cavium/liquidio/request_manager.c:383:27: warning:
 variable 'irh' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/cavium/liquidio/request_manager.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index bd0153e..c6f4cbd 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -380,7 +380,6 @@ static inline void __copy_cmd_into_iq(struct octeon_instr_queue *iq,
 	u32 inst_count = 0;
 	unsigned int pkts_compl = 0, bytes_compl = 0;
 	struct octeon_soft_command *sc;
-	struct octeon_instr_irh *irh;
 	unsigned long flags;
 
 	while (old != iq->octeon_read_index) {
@@ -402,14 +401,6 @@ static inline void __copy_cmd_into_iq(struct octeon_instr_queue *iq,
 		case REQTYPE_RESP_NET:
 		case REQTYPE_SOFT_COMMAND:
 			sc = buf;
-
-			if (OCTEON_CN23XX_PF(oct) || OCTEON_CN23XX_VF(oct))
-				irh = (struct octeon_instr_irh *)
-					&sc->cmd.cmd3.irh;
-			else
-				irh = (struct octeon_instr_irh *)
-					&sc->cmd.cmd2.irh;
-
 			/* We're expecting a response from Octeon.
 			 * It's up to lio_process_ordered_list() to
 			 * process  sc. Add sc to the ordered soft
