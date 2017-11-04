From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Nov 2017 07:51:36 +0000
Subject: powerpc/perf: Fix a sizeof() typo so we allocate less memory
Message-Id: <20171104075136.nujqcprikcevsfwv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Hemant Kumar <hemant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We're allocating the size of the struct which is 32 bytes when we should
be allocating sizeof(void *) which is 4 or 8 bytes depending on the
architecture.

Fixes: 885dcd709ba9 ("powerpc/perf: Add nest IMC PMU support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 88126245881b..91c90ddab807 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -210,7 +210,7 @@ static int update_events_in_group(struct device_node *node, struct imc_pmu *pmu)
 	of_property_read_u32(node, "reg", &base_reg);
 
 	/* Allocate memory for the events */
-	pmu->events = kcalloc(ct, sizeof(struct imc_events), GFP_KERNEL);
+	pmu->events = kcalloc(ct, sizeof(*pmu->events), GFP_KERNEL);
 	if (!pmu->events)
 		return -ENOMEM;
 
