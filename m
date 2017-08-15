From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Aug 2017 09:46:30 +0000
Subject: [PATCH] acpi/processor: make function acpi_processor_check_duplicates static
Message-Id: <20170815094630.20836-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function acpi_processor_check_duplicates is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warnings:
symbol 'acpi_processor_check_duplicates' was not declared. Should it
be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/acpi/acpi_processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index f098e25b6b41..86c10599d9f8 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -670,7 +670,7 @@ static acpi_status __init acpi_processor_ids_walk(acpi_handle handle,
 
 }
 
-void __init acpi_processor_check_duplicates(void)
+static void __init acpi_processor_check_duplicates(void)
 {
 	/* check the correctness for all processors in ACPI namespace */
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
-- 
2.11.0

