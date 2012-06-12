From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 16:26:33 +0000
Subject: [patch -next] irq_remap: silence a bogus pr_err()
Message-Id: <20120612162633.GA11077@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: Suresh Siddha <suresh.b.siddha@intel.com>, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an extra semicolon here so the pr_err() message is printed when
it is not intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_irq_remapping.c
index dafbad0..853902a 100644
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@ -938,7 +938,7 @@ intel_ioapic_set_affinity(struct irq_data *data, const struct cpumask *mask,
 
 	err = apic->cpu_mask_to_apicid_and(cfg->domain, mask, &dest);
 	if (err) {
-		if (assign_irq_vector(irq, cfg, data->affinity));
+		if (assign_irq_vector(irq, cfg, data->affinity))
 			pr_err("Failed to recover vector for irq %d\n", irq);
 		return err;
 	}
