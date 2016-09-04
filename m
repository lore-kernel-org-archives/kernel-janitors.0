From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 17:54:47 +0000
Subject: [PATCH 1/4] perf/x86/cqm: Use kmalloc_array() in intel_mbm_init()
Message-Id: <a1428b11-09f8-9e13-13a0-5a1367e070e6@users.sourceforge.net>
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
Date: Sun, 4 Sep 2016 17:28:13 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/events/intel/cqm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/cqm.c b/arch/x86/events/intel/cqm.c
index 783c49d..ec61522 100644
--- a/arch/x86/events/intel/cqm.c
+++ b/arch/x86/events/intel/cqm.c
@@ -1651,8 +1651,9 @@ static int intel_mbm_init(void)
 		goto out;
 	}
 
-	array_size = sizeof(struct hrtimer) * mbm_socket_max;
-	mbm_timers = kmalloc(array_size, GFP_KERNEL);
+	mbm_timers = kmalloc_array(mbm_socket_max,
+				   sizeof(*mbm_timers),
+				   GFP_KERNEL);
 	if (!mbm_timers) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.9.3

