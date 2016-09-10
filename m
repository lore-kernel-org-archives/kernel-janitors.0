From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:45:05 +0000
Subject: [PATCH 07/30] ACPI-processor: Rename jump labels in acpi_processor_get_psd()
Message-Id: <412ab79a-5036-7514-5ef9-2bfacef6d389@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 13:50:41 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_perflib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 417e181..c2813cc 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -545,13 +545,13 @@ static int acpi_processor_get_psd(struct acpi_processor	*pr)
 	if (!psd || (psd->type != ACPI_TYPE_PACKAGE)) {
 		printk(KERN_ERR PREFIX "Invalid _PSD data\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	if (psd->package.count != 1) {
 		printk(KERN_ERR PREFIX "Invalid _PSD data\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	pdomain = &(pr->performance->domain_info);
@@ -564,19 +564,19 @@ static int acpi_processor_get_psd(struct acpi_processor	*pr)
 	if (ACPI_FAILURE(status)) {
 		printk(KERN_ERR PREFIX "Invalid _PSD data\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	if (pdomain->num_entries != ACPI_PSD_REV0_ENTRIES) {
 		printk(KERN_ERR PREFIX "Unknown _PSD:num_entries\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	if (pdomain->revision != ACPI_PSD_REV0_REVISION) {
 		printk(KERN_ERR PREFIX "Unknown _PSD:revision\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	if (pdomain->coord_type != DOMAIN_COORD_TYPE_SW_ALL &&
@@ -584,9 +584,8 @@ static int acpi_processor_get_psd(struct acpi_processor	*pr)
 	    pdomain->coord_type != DOMAIN_COORD_TYPE_HW_ALL) {
 		printk(KERN_ERR PREFIX "Invalid _PSD:coord_type\n");
 		result = -EFAULT;
-		goto end;
 	}
-end:
+ free_buffer:
 	kfree(buffer.pointer);
 	return result;
 }
-- 
2.10.0

