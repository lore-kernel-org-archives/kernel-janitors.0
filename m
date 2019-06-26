From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Jun 2019 12:43:23 +0000
Subject: [PATCH][next] nvme-trace: fix spelling mistake "spcecific" -> "specific"
Message-Id: <20190626124323.5925-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in trace_seq_printf messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvme/host/trace.c   | 2 +-
 drivers/nvme/target/trace.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/trace.c b/drivers/nvme/host/trace.c
index f01ad0fd60bb..6980ab827233 100644
--- a/drivers/nvme/host/trace.c
+++ b/drivers/nvme/host/trace.c
@@ -178,7 +178,7 @@ static const char *nvme_trace_fabrics_common(struct trace_seq *p, u8 *spc)
 {
 	const char *ret = trace_seq_buffer_ptr(p);
 
-	trace_seq_printf(p, "spcecific=%*ph", 24, spc);
+	trace_seq_printf(p, "specific=%*ph", 24, spc);
 	trace_seq_putc(p, 0);
 	return ret;
 }
diff --git a/drivers/nvme/target/trace.c b/drivers/nvme/target/trace.c
index cdcdd14c6408..6af11d493271 100644
--- a/drivers/nvme/target/trace.c
+++ b/drivers/nvme/target/trace.c
@@ -146,7 +146,7 @@ static const char *nvmet_trace_fabrics_common(struct trace_seq *p, u8 *spc)
 {
 	const char *ret = trace_seq_buffer_ptr(p);
 
-	trace_seq_printf(p, "spcecific=%*ph", 24, spc);
+	trace_seq_printf(p, "specific=%*ph", 24, spc);
 	trace_seq_putc(p, 0);
 	return ret;
 }
-- 
2.20.1
