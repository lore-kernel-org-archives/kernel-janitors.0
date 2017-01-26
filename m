From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jan 2017 09:05:27 +0000
Subject: [patch net-next] smc: some potential use after free bugs
Message-Id: <20170126090527.GA966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-s390@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Say we got really unlucky and these failed on the last iteration, then
it could lead to a use after free bug.

Fixes: cd6851f30386 ("smc: remote memory buffers (RMBs)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index 8b1d34378829..941279e1504e 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -535,6 +535,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
 			/* if send buffer allocation has failed,
 			 * try a smaller one
 			 */
+			sndbuf_desc = NULL;
 			continue;
 		}
 		rc = smc_ib_buf_map(lgr->lnk[SMC_SINGLE_LINK].smcibdev,
@@ -543,6 +544,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
 		if (rc) {
 			kfree(sndbuf_desc->cpu_addr);
 			kfree(sndbuf_desc);
+			sndbuf_desc = NULL;
 			continue; /* if mapping failed, try smaller one */
 		}
 		sndbuf_desc->used = 1;
@@ -599,6 +601,7 @@ int smc_rmb_create(struct smc_sock *smc)
 			/* if RMB allocation has failed,
 			 * try a smaller one
 			 */
+			rmb_desc = NULL;
 			continue;
 		}
 		rc = smc_ib_buf_map(lgr->lnk[SMC_SINGLE_LINK].smcibdev,
@@ -607,6 +610,7 @@ int smc_rmb_create(struct smc_sock *smc)
 		if (rc) {
 			kfree(rmb_desc->cpu_addr);
 			kfree(rmb_desc);
+			rmb_desc = NULL;
 			continue; /* if mapping failed, try smaller one */
 		}
 		rc = smc_ib_get_memory_region(lgr->lnk[SMC_SINGLE_LINK].roce_pd,
@@ -619,6 +623,7 @@ int smc_rmb_create(struct smc_sock *smc)
 					 DMA_FROM_DEVICE);
 			kfree(rmb_desc->cpu_addr);
 			kfree(rmb_desc);
+			rmb_desc = NULL;
 			continue;
 		}
 		rmb_desc->used = 1;
