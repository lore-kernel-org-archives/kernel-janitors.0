From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 10:02:19 +0000
Subject: [PATCH 1/2] cpumask: Introduce possible_cpu_safe()
Message-Id: <20190404100218.GA26946@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
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
 include/linux/cpumask.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 147bdec42215..515179760c54 100644
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
@@ -344,6 +347,21 @@ static inline int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
 	return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
 }
 
+/**
+ * cpumask_test_cpu_safe - test for a cpu in a cpumask
+ * @cpu: cpu number
+ * @cpumask: the cpumask pointer
+ *
+ * Returns 1 if @cpu is valid and set in @cpumask, else returns 0
+ */
+static inline int cpumask_test_cpu_safe(int cpu, const struct cpumask *cpumask)
+{
+	if ((unsigned int)cpu >= nr_cpu_ids)
+		return 0;
+	cpu = array_index_nospec(cpu, NR_CPUS);
+	return test_bit(cpu, cpumask_bits(cpumask));
+}
+
 /**
  * cpumask_test_and_set_cpu - atomically test and set a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)
-- 
2.17.1
