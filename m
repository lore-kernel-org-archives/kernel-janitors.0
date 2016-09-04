From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 17:56:30 +0000
Subject: [PATCH 2/4] perf/x86/cqm: Replace two kmalloc() calls by kmalloc_array() in intel_mbm_init()
Message-Id: <ea335aea-b897-875e-4852-1376f6c50821@users.sourceforge.net>
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
Date: Sun, 4 Sep 2016 18:25:09 +0200

1. A multiplication for the size determination of memory allocations
   indicated that array data structures should be processed.
   Thus use the corresponding function "kmalloc_array".

2. Replace the specification of a data structure by pointer dereferences
   to make the corresponding size determination a bit safer according to
   the Linux coding style convention.

3. Delete the local variable "array_size" which became unnecessary
   with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/events/intel/cqm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/intel/cqm.c b/arch/x86/events/intel/cqm.c
index ec61522..29f756e 100644
--- a/arch/x86/events/intel/cqm.c
+++ b/arch/x86/events/intel/cqm.c
@@ -1637,15 +1637,18 @@ static const struct x86_cpu_id intel_mbm_total_match[] = {
 
 static int intel_mbm_init(void)
 {
-	int ret = 0, array_size, maxid = cqm_max_rmid + 1;
+	int ret = 0, maxid = cqm_max_rmid + 1;
 
 	mbm_socket_max = topology_max_packages();
-	array_size = sizeof(struct sample) * maxid * mbm_socket_max;
-	mbm_local = kmalloc(array_size, GFP_KERNEL);
+	mbm_local = kmalloc_array(maxid * mbm_socket_max,
+				  sizeof(*mbm_local),
+				  GFP_KERNEL);
 	if (!mbm_local)
 		return -ENOMEM;
 
-	mbm_total = kmalloc(array_size, GFP_KERNEL);
+	mbm_total = kmalloc_array(maxid * mbm_socket_max,
+				  sizeof(*mbm_total),
+				  GFP_KERNEL);
 	if (!mbm_total) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.9.3

