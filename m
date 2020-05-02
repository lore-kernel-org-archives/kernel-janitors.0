From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 02 May 2020 11:59:49 +0000
Subject: [PATCH] powerpc/powernv: Fix a warning message
Message-Id: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com, tglx@linutronix.de, maddy@linux.vnet.ibm.com, cclaudio@linux.ibm.com, zhangshaokun@hisilicon.com, atrajeev@linux.vnet.ibm.com, akshay.adiga@linux.vnet.ibm.com, ego@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Fix a cut'n'paste error in a warning message. This should be
'cpu-idle-state-residency-ns' to match the property searched in the
previous 'of_property_read_u32_array()'

Fixes: 9c7b185ab2fe ("powernv/cpuidle: Parse dt idle properties into global structure")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/platforms/powernv/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 78599bca66c2..2dd467383a88 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1270,7 +1270,7 @@ static int pnv_parse_cpuidle_dt(void)
 	/* Read residencies */
 	if (of_property_read_u32_array(np, "ibm,cpu-idle-state-residency-ns",
 				       temp_u32, nr_idle_states)) {
-		pr_warn("cpuidle-powernv: missing ibm,cpu-idle-state-latencies-ns in DT\n");
+		pr_warn("cpuidle-powernv: missing ibm,cpu-idle-state-residency-ns in DT\n");
 		rc = -EINVAL;
 		goto out;
 	}
-- 
2.25.1
