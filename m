From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:55:30 +0000
Subject: [PATCH 13/30] ACPI-processor: Delete an unnecessary initialisation in acpi_processor_ppc_notifier()
Message-Id: <9965aba5-4da1-6a28-8940-04228586b525@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
In-Reply-To: <f9e5eb7c-54df-931c-e419-f9253e2abf20@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Sep 2016 19:06:18 +0200

The local variable "ppc" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/processor_perflib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 86256bd..43f8eef 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -73,7 +73,7 @@ static int acpi_processor_ppc_notifier(struct notifier_block *nb,
 {
 	struct cpufreq_policy *policy = data;
 	struct acpi_processor *pr;
-	unsigned int ppc = 0;
+	unsigned int ppc;
 
 	if (event = CPUFREQ_START && ignore_ppc <= 0) {
 		ignore_ppc = 0;
-- 
2.10.0

