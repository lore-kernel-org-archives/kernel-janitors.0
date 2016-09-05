From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 08:12:30 +0000
Subject: [PATCH 3/4] x86/smpboot: Replace one kzalloc() call by kcalloc()
Message-Id: <b547ba2e-5152-2720-551b-a22ad88ca4fc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
In-Reply-To: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Andi Kleen <ak@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 09:29:40 +0200

* The script "checkpatch.pl" can point information out like the following.

  WARNING: Prefer kcalloc over kzalloc with multiply

  Thus fix the affected source code place.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

* Delete the local variable "size" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/smpboot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 2ce06ef..e3fdc44 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -311,7 +311,6 @@ EXPORT_SYMBOL(topology_phys_to_logical_pkg);
 static void __init smp_init_package_map(void)
 {
 	unsigned int ncpus, cpu;
-	size_t size;
 
 	/*
 	 * Today neither Intel nor AMD support heterogenous systems. That
@@ -357,8 +356,9 @@ static void __init smp_init_package_map(void)
 	memset(physical_to_logical_pkg,
 	       0xff,
 	       sizeof(*physical_to_logical_pkg) * max_physical_pkg_id);
-	size = BITS_TO_LONGS(max_physical_pkg_id) * sizeof(unsigned long);
-	physical_package_map = kzalloc(size, GFP_KERNEL);
+	physical_package_map = kcalloc(BITS_TO_LONGS(max_physical_pkg_id),
+				       sizeof(*physical_package_map),
+				       GFP_KERNEL);
 
 	for_each_present_cpu(cpu) {
 		unsigned int apicid = apic->cpu_present_to_apicid(cpu);
-- 
2.9.3

