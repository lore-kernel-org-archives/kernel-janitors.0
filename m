From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 10:10:37 +0000
Subject: [PATCH 28/30] ACPI-processor: Rename a jump label in acpi_processor_get_platform_limit()
Message-Id: <5db577f7-d95a-4af5-15a5-5d63734824f4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 21:50:04 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_throttling.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/processor_throttling.c b/drivers/acpi/processor_throttling.c
index d22bcfc..7e54a83 100644
--- a/drivers/acpi/processor_throttling.c
+++ b/drivers/acpi/processor_throttling.c
@@ -294,7 +294,7 @@ static int acpi_processor_get_platform_limit(struct acpi_processor *pr)
 		return -EINVAL;
 
 	if (ignore_tpc)
-		goto end;
+		goto limit_throttling;
 
 	status = acpi_evaluate_integer(pr->handle, "_TPC", NULL, &tpc);
 	if (ACPI_FAILURE(status)) {
@@ -303,8 +303,7 @@ static int acpi_processor_get_platform_limit(struct acpi_processor *pr)
 		}
 		return -ENODEV;
 	}
-
-end:
+ limit_throttling:
 	pr->throttling_platform_limit = (int)tpc;
 	return 0;
 }
-- 
2.10.0

