From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 23 Jan 2019 01:56:31 +0000
Subject: [PATCH -next] perf: xgene: Remove set but not used variable 'config'
Message-Id: <1548208591-46158-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Tai Nguyen <ttnguyen@apm.com>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/perf/xgene_pmu.c: In function 'xgene_perf_stop':
drivers/perf/xgene_pmu.c:1055:6: warning:
 variable 'config' set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/perf/xgene_pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index d4ec048..27574e8 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -1052,7 +1052,6 @@ static void xgene_perf_start(struct perf_event *event, int flags)
 static void xgene_perf_stop(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hw = &event->hw;
-	u64 config;
 
 	if (hw->state & PERF_HES_UPTODATE)
 		return;
@@ -1064,7 +1063,6 @@ static void xgene_perf_stop(struct perf_event *event, int flags)
 	if (hw->state & PERF_HES_UPTODATE)
 		return;
 
-	config = hw->config;
 	xgene_perf_read(event);
 	hw->state |= PERF_HES_UPTODATE;
 }
