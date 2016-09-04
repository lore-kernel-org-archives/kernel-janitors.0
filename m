From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 18:00:15 +0000
Subject: [PATCH 4/4] perf/x86/cqm: Rename jump labels in intel_cqm_init()
Message-Id: <12037a23-1511-f0ae-a07c-2ffd6650f5e1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <9d893198-dd12-14a8-74bd-02fc42de4bf4@users.sourceforge.net>
In-Reply-To: <9d893198-dd12-14a8-74bd-02fc42de4bf4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Richard Cochran <rcochran@linutronix.de>, Stephane Eranian <eranian@google.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Sep 2016 19:23:57 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/events/intel/cqm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/intel/cqm.c b/arch/x86/events/intel/cqm.c
index 304caf53..6cf508a 100644
--- a/arch/x86/events/intel/cqm.c
+++ b/arch/x86/events/intel/cqm.c
@@ -1701,7 +1701,7 @@ static int __init intel_cqm_init(void)
 		if (c->x86_cache_occ_scale != cqm_l3_scale) {
 			pr_err("Multiple LLC scale values, disabling\n");
 			ret = -EINVAL;
-			goto out;
+			goto put_cpus;
 		}
 	}
 
@@ -1719,19 +1719,19 @@ static int __init intel_cqm_init(void)
 	str = kstrdup(scale, GFP_KERNEL);
 	if (!str) {
 		ret = -ENOMEM;
-		goto out;
+		goto put_cpus;
 	}
 
 	event_attr_intel_cqm_llc_scale.event_str = str;
 
 	ret = intel_cqm_setup_rmid_cache();
 	if (ret)
-		goto out;
+		goto put_cpus;
 
 	if (mbm_enabled)
 		ret = intel_mbm_init();
 	if (ret && !cqm_enabled)
-		goto out;
+		goto put_cpus;
 
 	if (cqm_enabled && mbm_enabled)
 		intel_cqm_events_group.attrs = intel_cmt_mbm_events_attr;
@@ -1743,7 +1743,7 @@ static int __init intel_cqm_init(void)
 	ret = perf_pmu_register(&intel_cqm_pmu, "intel_cqm", -1);
 	if (ret) {
 		pr_err("Intel CQM perf registration failed: %d\n", ret);
-		goto out;
+		goto put_cpus;
 	}
 
 	if (cqm_enabled)
@@ -1760,8 +1760,7 @@ static int __init intel_cqm_init(void)
 			  intel_cqm_cpu_starting, NULL);
 	cpuhp_setup_state(CPUHP_AP_PERF_X86_CQM_ONLINE, "AP_PERF_X86_CQM_ONLINE",
 			  NULL, intel_cqm_cpu_exit);
-
-out:
+ put_cpus:
 	put_online_cpus();
 
 	if (ret) {
-- 
2.9.3

