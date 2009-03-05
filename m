From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:15:44 +0000
Subject: [PATCH v2 08/15] NULL noise: drivers/platform/x86/panasonic-laptop.c
Message-Id: <20090305191540.30062.33257.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Len Brown <len.brown@intel.com>

Fix this sparse warning:
  drivers/platform/x86/panasonic-laptop.c:273:70: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 drivers/platform/x86/panasonic-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index c47a44d..e178cde 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -270,7 +270,7 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc, u32 *sinf)
 	union acpi_object *hkey = NULL;
 	int i;
 
-	status = acpi_evaluate_object(pcc->handle, METHOD_HKEY_SINF, 0,
+	status = acpi_evaluate_object(pcc->handle, METHOD_HKEY_SINF, NULL,
 				      &buffer);
 	if (ACPI_FAILURE(status)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,

