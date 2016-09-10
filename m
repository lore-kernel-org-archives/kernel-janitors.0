From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 10:00:28 +0000
Subject: [PATCH 18/30] ACPI-processor: Rename jump labels in acpi_processor_get_throttling_states()
Message-Id: <c0c1a848-a784-a60b-b110-1cd5d5c943d5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 19:26:33 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_throttling.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/processor_throttling.c b/drivers/acpi/processor_throttling.c
index c5ddf96..665e8de 100644
--- a/drivers/acpi/processor_throttling.c
+++ b/drivers/acpi/processor_throttling.c
@@ -526,7 +526,7 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 	if (!tss || (tss->type != ACPI_TYPE_PACKAGE)) {
 		printk(KERN_ERR PREFIX "Invalid _TSS data\n");
 		result = -EFAULT;
-		goto end;
+		goto free_buffer;
 	}
 
 	ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Found %d throttling states\n",
@@ -539,7 +539,7 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 						  GFP_KERNEL);
 	if (!pr->throttling.states_tss) {
 		result = -ENOMEM;
-		goto end;
+		goto free_buffer;
 	}
 
 	for (i = 0; i < pr->throttling.state_count; i++) {
@@ -559,7 +559,7 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 			ACPI_EXCEPTION((AE_INFO, status, "Invalid _TSS data"));
 			result = -EFAULT;
 			kfree(pr->throttling.states_tss);
-			goto end;
+			goto free_buffer;
 		}
 
 		if (!tx->freqpercentage) {
@@ -567,11 +567,10 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 			       "Invalid _TSS data: freq is zero\n");
 			result = -EFAULT;
 			kfree(pr->throttling.states_tss);
-			goto end;
+			goto free_buffer;
 		}
 	}
-
-      end:
+ free_buffer:
 	kfree(buffer.pointer);
 
 	return result;
-- 
2.10.0

