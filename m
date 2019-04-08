From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Apr 2019 08:09:50 +0000
Subject: [PATCH v2 1/2] cpumask: Introduce possible_cpu_safe()
Message-Id: <20190408080950.GA15239@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190404104527.GX4038@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>
Cc: Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

There have been two cases recently where we pass user a controlled "cpu"
to possible_cpus().  That's not allowed.  If it's invalid, it will
trigger a WARN_ONCE() and an out of bounds read which could result in an
Oops.

This patch introduces possible_cpu_safe() which first checks to see if
the cpu is valid, turns off speculation and then checks if the cpu is
possible.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use nr_cpumask_bits instead of NR_CPUS.
    Split cpumask_validate_cpu() into a separate function.

I still left cpumask_test_cpu_safe() return 0 for invalid cpus, instead
of returning -ERANGE I feel it's simpler to stay consistent with the
normal possible_cpu() function.

 include/linux/cpumask.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 147bdec42215..f371e44cb5ff 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -11,6 +11,7 @@
 #include <linux/threads.h>
 #include <linux/bitmap.h>
 #include <linux/bug.h>
+#include <linux/nospec.h>
 
 /* Don't assign or return these: may not be this big! */
 typedef struct cpumask { DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
@@ -102,6 +103,7 @@ extern struct cpumask __cpu_active_mask;
 #define num_active_cpus()	cpumask_weight(cpu_active_mask)
 #define cpu_online(cpu)		cpumask_test_cpu((cpu), cpu_online_mask)
 #define cpu_possible(cpu)	cpumask_test_cpu((cpu), cpu_possible_mask)
+#define cpu_possible_safe(cpu)	cpumask_test_cpu_safe((cpu), cpu_possible_mask)
 #define cpu_present(cpu)	cpumask_test_cpu((cpu), cpu_present_mask)
 #define cpu_active(cpu)		cpumask_test_cpu((cpu), cpu_active_mask)
 #else
@@ -111,6 +113,7 @@ extern struct cpumask __cpu_active_mask;
 #define num_active_cpus()	1U
 #define cpu_online(cpu)		((cpu) = 0)
 #define cpu_possible(cpu)	((cpu) = 0)
+#define cpu_possible_safe(cpu)  ((cpu) = 0)
 #define cpu_present(cpu)	((cpu) = 0)
 #define cpu_active(cpu)		((cpu) = 0)
 #endif
@@ -344,6 +347,28 @@ static inline int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
 	return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
 }
 
+static inline unsigned int cpumask_validate_cpu(unsigned int cpu)
+{
+	if (cpu >= nr_cpumask_bits)
+		return nr_cpumask_bits;
+	return array_index_nospec(cpu, nr_cpumask_bits);
+}
+
+/**
+ * cpumask_test_cpu_safe - test for a cpu in a cpumask
+ * @cpu: cpu number
+ * @cpumask: the cpumask pointer
+ *
+ * Returns 1 if @cpu is valid and set in @cpumask, else returns 0
+ */
+static inline int cpumask_test_cpu_safe(int cpu, const struct cpumask *cpumask)
+{
+	cpu = cpumask_validate_cpu(cpu);
+	if (cpu >= nr_cpu_ids)
+		return 0;
+	return test_bit(cpu, cpumask_bits(cpumask));
+}
+
 /**
  * cpumask_test_and_set_cpu - atomically test and set a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)
-- 
2.17.1
