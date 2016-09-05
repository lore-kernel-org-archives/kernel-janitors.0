From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 08:13:23 +0000
Subject: [PATCH 4/4] x86/smpboot: Return directly after a failed kcalloc()
Message-Id: <f11256ad-f312-53b6-8509-461392e1fd7d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
In-Reply-To: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Andi Kleen <ak@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 09:39:05 +0200

Return directly after a memory allocation failed in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/smpboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index e3fdc44..a30f625 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -359,6 +359,10 @@ static void __init smp_init_package_map(void)
 	physical_package_map = kcalloc(BITS_TO_LONGS(max_physical_pkg_id),
 				       sizeof(*physical_package_map),
 				       GFP_KERNEL);
+	if (!physical_package_map) {
+		kfree(physical_to_logical_pkg);
+		return;
+	}
 
 	for_each_present_cpu(cpu) {
 		unsigned int apicid = apic->cpu_present_to_apicid(cpu);
-- 
2.9.3

