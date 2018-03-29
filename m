From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2018 09:01:53 +0000
Subject: [PATCH v2] xen/acpi: off by one in read_acpi_id()
Message-Id: <20180329090153.GA17927@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8a2f028-8bbe-ae14-41ff-26c99850cba8@oracle.com>
In-Reply-To: <b8a2f028-8bbe-ae14-41ff-26c99850cba8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org

If acpi_id is = nr_acpi_bits, then we access one element beyond the end
of the acpi_psd[] array or we set one bit beyond the end of the bit map
when we do __set_bit(acpi_id, acpi_id_present);

Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index c80195e8fbd1..b29f4e40851f 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -364,9 +364,9 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	}
 	/* There are more ACPI Processor objects than in x2APIC or MADT.
 	 * This can happen with incorrect ACPI SSDT declerations. */
-	if (acpi_id > nr_acpi_bits) {
-		pr_debug("We only have %u, trying to set %u\n",
-			 nr_acpi_bits, acpi_id);
+	if (acpi_id >= nr_acpi_bits) {
+		pr_debug("max acpi id %u, trying to set %u\n",
+			 nr_acpi_bits - 1, acpi_id);
 		return AE_OK;
 	}
 	/* OK, There is a ACPI Processor object */
