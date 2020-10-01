From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Oct 2020 11:39:00 +0000
Subject: [PATCH] x86/events/amd/iommu: fix sizeof mismatch
Message-Id: <20201001113900.58889-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof is being used, struct attribute ** is not correct,
it should be struct attribute *. Note that since ** is the same size as
* this is not causing any issues.  Improve this fix by using sizeof(*attrs)
as this allows us to not even reference the type of the pointer.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 51686546304f ("x86/events/amd/iommu: Fix sysfs perf attribute groups")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/amd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/iommu.c b/arch/x86/events/amd/iommu.c
index fb616203ce42..be50ef8572cc 100644
--- a/arch/x86/events/amd/iommu.c
+++ b/arch/x86/events/amd/iommu.c
@@ -379,7 +379,7 @@ static __init int _init_events_attrs(void)
 	while (amd_iommu_v2_event_descs[i].attr.attr.name)
 		i++;
 
-	attrs = kcalloc(i + 1, sizeof(struct attribute **), GFP_KERNEL);
+	attrs = kcalloc(i + 1, sizeof(*attrs), GFP_KERNEL);
 	if (!attrs)
 		return -ENOMEM;
 
-- 
2.27.0
