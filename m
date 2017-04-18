From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 16:53:29 +0000
Subject: [PATCH 3/6] ACPI-nfit: Use devm_kcalloc() in nfit_mem_dcr_init()
Message-Id: <bb45bf45-8f42-c169-32f3-6987b2d44de2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <077115e4-8ec3-9c6d-0374-8ffc5e0f85c0@users.sourceforge.net>
In-Reply-To: <077115e4-8ec3-9c6d-0374-8ffc5e0f85c0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Borislav Petkov <bp@suse.de>, Chun-Yi Lee <joeyli.kernel@gmail.com>, Colin Ian King <colin.king@canonical.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Linda Knippers <linda.knippers@hpe.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony Luck <tony.luck@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 17:30:15 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/nfit/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index 462e77272272..1aa625dc424a 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -809,9 +809,11 @@ static int nfit_mem_dcr_init(struct acpi_nfit_desc *acpi_desc,
 				continue;
 			nfit_mem->nfit_flush = nfit_flush;
 			flush = nfit_flush->flush;
-			nfit_mem->flush_wpq = devm_kzalloc(acpi_desc->dev,
-					flush->hint_count
-					* sizeof(struct resource), GFP_KERNEL);
+			nfit_mem->flush_wpq
+				= devm_kcalloc(acpi_desc->dev,
+					       flush->hint_count,
+					       sizeof(*nfit_mem->flush_wpq),
+					       GFP_KERNEL);
 			if (!nfit_mem->flush_wpq)
 				return -ENOMEM;
 			for (i = 0; i < flush->hint_count; i++) {
-- 
2.12.2

