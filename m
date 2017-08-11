From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Aug 2017 20:05:41 +0000
Subject: [PATCH] powerpc/perf: double unlock bug in imc_common_cpuhp_mem_free()
Message-Id: <20170811200541.qlxcpp3og33sdki3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Hemant Kumar <hemant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

There is a typo so we call unlock instead of lock.

Fixes: 885dcd709ba9 ("powerpc/perf: Add nest IMC PMU support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I also don't understand how the &nest_imc_refc[node_id].lock works.  Why
can't we use ref->lock everywhere?  They seem equivalent, and my static
checker complains if we call the same lock different names.

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 46cd912af060..52017f6eafd9 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1124,7 +1124,7 @@ static void cleanup_all_thread_imc_memory(void)
 static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
 {
 	if (pmu_ptr->domain = IMC_DOMAIN_NEST) {
-		mutex_unlock(&nest_init_lock);
+		mutex_lock(&nest_init_lock);
 		if (nest_pmus = 1) {
 			cpuhp_remove_state(CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE);
 			kfree(nest_imc_refc);
