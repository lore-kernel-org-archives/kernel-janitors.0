From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2018 11:47:47 +0000
Subject: [PATCH] xen/acpi: off by one in read_acpi_id()
Message-Id: <20180328114747.GB29050@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org

If acpi_id is = nr_acpi_bits, then we access one element beyond the end
of the acpi_psd[] array or we set one bit beyond the end of the bit map
when we do __set_bit(acpi_id, acpi_id_cst_present);

Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index c80195e8fbd1..d23c9c150199 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -364,7 +364,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	}
 	/* There are more ACPI Processor objects than in x2APIC or MADT.
 	 * This can happen with incorrect ACPI SSDT declerations. */
-	if (acpi_id > nr_acpi_bits) {
+	if (acpi_id >= nr_acpi_bits) {
 		pr_debug("We only have %u, trying to set %u\n",
 			 nr_acpi_bits, acpi_id);
 		return AE_OK;
