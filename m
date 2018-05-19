From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 May 2018 06:37:15 +0000
Subject: [PATCH] firmware: arm_scmi: remove some unnecessary checks
Message-Id: <20180519063715.GB4991@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The "pi->dom_info" buffer is allocated in init() and it can't be NULL
here.  These tests are sort of weird as well because if "pi->dom_info"
was NULL but "domain" was non-zero then it would lead to an Oops.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 2a219b1261b1..721e6c57beae 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -363,8 +363,6 @@ static int scmi_dvfs_device_opps_add(const struct scmi_handle *handle,
 		return domain;
 
 	dom = pi->dom_info + domain;
-	if (!dom)
-		return -EIO;
 
 	for (opp = dom->opp, idx = 0; idx < dom->opp_count; idx++, opp++) {
 		freq = opp->perf * dom->mult_factor;
@@ -394,9 +392,6 @@ static int scmi_dvfs_transition_latency_get(const struct scmi_handle *handle,
 		return domain;
 
 	dom = pi->dom_info + domain;
-	if (!dom)
-		return -EIO;
-
 	/* uS to nS */
 	return dom->opp[dom->opp_count - 1].trans_latency_us * 1000;
 }
