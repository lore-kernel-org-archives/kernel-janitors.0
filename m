From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Aug 2017 15:57:09 +0000
Subject: [PATCH] perf/x86/intel/bts: make bts_pmu static
Message-Id: <20170810155709.7094-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure bts_pmu is local to the source and do not need to be in
global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'bts_pmu' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/bts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
index 8ae8c5ce3a1f..ddd8d3516bfc 100644
--- a/arch/x86/events/intel/bts.c
+++ b/arch/x86/events/intel/bts.c
@@ -69,7 +69,7 @@ struct bts_buffer {
 	struct bts_phys	buf[0];
 };
 
-struct pmu bts_pmu;
+static struct pmu bts_pmu;
 
 static size_t buf_size(struct page *page)
 {
-- 
2.11.0

