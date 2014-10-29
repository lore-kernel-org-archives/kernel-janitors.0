From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 08:45:04 +0000
Subject: [patch] percpu: off by one in BUG_ON()
Message-Id: <20141029084504.GD8939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

The unit_map[] array has "nr_cpu_ids" number of elements.  It's
allocated a few lines earlier in the function.  So this test should be
>= instead of >.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Not tested.

diff --git a/mm/percpu.c b/mm/percpu.c
index 014bab6..d39e2f4 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1591,7 +1591,7 @@ int __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 			if (cpu = NR_CPUS)
 				continue;
 
-			PCPU_SETUP_BUG_ON(cpu > nr_cpu_ids);
+			PCPU_SETUP_BUG_ON(cpu >= nr_cpu_ids);
 			PCPU_SETUP_BUG_ON(!cpu_possible(cpu));
 			PCPU_SETUP_BUG_ON(unit_map[cpu] != UINT_MAX);
 
