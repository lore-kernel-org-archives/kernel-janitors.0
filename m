From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2015 12:29:25 +0000
Subject: [patch] ACPI / tables: test the correct variable
Message-Id: <20150922122925.GA27407@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent was to test "proc[i].handler" instead of "proc->handler".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index c1ff58d..6c0f079 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -268,7 +268,8 @@ acpi_parse_entries_array(char *id, unsigned long table_size,
 		for (i = 0; i < proc_num; i++) {
 			if (entry->type != proc[i].id)
 				continue;
-			if (!proc->handler || proc[i].handler(entry, table_end))
+			if (!proc[i].handler ||
+			     proc[i].handler(entry, table_end))
 				return -EINVAL;
 
 			proc->count++;
