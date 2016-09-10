From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:59:28 +0000
Subject: [PATCH 17/30] ACPI-processor: Improve another size determination in acpi_processor_get_throttling_st
Message-Id: <2b499c49-838a-06b6-b537-ec24bbf00f90@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 19:19:27 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_throttling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/processor_throttling.c b/drivers/acpi/processor_throttling.c
index 0a46b7f..c5ddf96 100644
--- a/drivers/acpi/processor_throttling.c
+++ b/drivers/acpi/processor_throttling.c
@@ -548,7 +548,7 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 		    (struct acpi_processor_tx_tss *)&(pr->throttling.
 						      states_tss[i]);
 
-		state.length = sizeof(struct acpi_processor_tx_tss);
+		state.length = sizeof(*tx);
 		state.pointer = tx;
 
 		ACPI_DEBUG_PRINT((ACPI_DB_INFO, "Extracting state %d\n", i));
-- 
2.10.0

