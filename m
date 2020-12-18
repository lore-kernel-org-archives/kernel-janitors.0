From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Fri, 18 Dec 2020 06:31:17 +0000
Subject: [PATCH] media: cec: fix trivial style warnings
Message-Id: <20201218063117.GA80700@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sakari.ailus@linux.intel.com, dan.carpenter@oracle.com, gustavoars@kernel.org
Cc: linux-media@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

Comment has 'then' repeated twice. Let's clean it up.
Use unsigned int to maintain naming consistency.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/media/cec/core/cec-adap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index d5d5d28d0b36..79fa36de8a04 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1296,7 +1296,7 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 	/*
 	 * If we are unable to get an OK or a NACK after max_retries attempts
 	 * (and note that each attempt already consists of four polls), then
-	 * then we assume that something is really weird and that it is not a
+	 * we assume that something is really weird and that it is not a
 	 * good idea to try and claim this logical address.
 	 */
 	if (i = max_retries)
@@ -1735,7 +1735,7 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		const u8 feature_sz = ARRAY_SIZE(log_addrs->features[0]);
 		u8 *features = log_addrs->features[i];
 		bool op_is_dev_features = false;
-		unsigned j;
+		unsigned int j;
 
 		log_addrs->log_addr[i] = CEC_LOG_ADDR_INVALID;
 		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
-- 
2.29.2
