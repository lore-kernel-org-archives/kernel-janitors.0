From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 10:04:43 +0000
Subject: [PATCH 22/30] ACPI-processor: Delete two unnecessary initialisations in acpi_processor_get_tsd()
Message-Id: <16582716-99b7-dea2-0d34-7e390514e61e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 20:52:33 +0200

The local variables "tsd" and "status" will be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_throttling.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/processor_throttling.c b/drivers/acpi/processor_throttling.c
index 2e3ef48..ea1e959 100644
--- a/drivers/acpi/processor_throttling.c
+++ b/drivers/acpi/processor_throttling.c
@@ -582,11 +582,11 @@ static int acpi_processor_get_throttling_states(struct acpi_processor *pr)
 static int acpi_processor_get_tsd(struct acpi_processor *pr)
 {
 	int result = 0;
-	acpi_status status = AE_OK;
+	acpi_status status;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer format = { sizeof("NNNNN"), "NNNNN" };
 	struct acpi_buffer state = { 0, NULL };
-	union acpi_object *tsd = NULL;
+	union acpi_object *tsd;
 	struct acpi_tsd_package *pdomain;
 	struct acpi_processor_throttling *pthrottling;
 
-- 
2.10.0

