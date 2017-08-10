From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Aug 2017 16:09:18 +0000
Subject: [PATCH] perf/x86/intel/rapl: make array rapl_attr_groups static
Message-Id: <20170810160918.7461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, David Carrillo-Cisneros <davidcc@google.com>, Peter Zijlstra <peterz@infradead.org>, Vince Weaver <vincent.weaver@maine.edu>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Borislav Petkov <bp@suse.de>, Harry Pan <harry.pan@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array rapl_attr_groups  is local to the source and do not need to be in
global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'rapl_attr_groups' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/rapl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/rapl.c b/arch/x86/events/intel/rapl.c
index a45e2114a846..8e2457cb6b4a 100644
--- a/arch/x86/events/intel/rapl.c
+++ b/arch/x86/events/intel/rapl.c
@@ -559,7 +559,7 @@ static struct attribute_group rapl_pmu_format_group = {
 	.attrs = rapl_formats_attr,
 };
 
-const struct attribute_group *rapl_attr_groups[] = {
+static const struct attribute_group *rapl_attr_groups[] = {
 	&rapl_pmu_attr_group,
 	&rapl_pmu_format_group,
 	&rapl_pmu_events_group,
-- 
2.11.0

