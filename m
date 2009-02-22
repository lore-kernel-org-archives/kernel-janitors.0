From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:02:35 +0000
Subject: [PATCH 07/16] panasonic-laptop: fix sparse warning: Using plain
Message-Id: <20090222000228.17557.1852.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/platform/x86/panasonic-laptop.c:273:70: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
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

