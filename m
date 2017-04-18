From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 16:56:36 +0000
Subject: [PATCH 6/6] ACPI-proc: Replace two seq_printf() calls by seq_puts() in acpi_system_wakeup_device_seq
Message-Id: <fabd4849-37ab-948c-6a23-76b7b1e24390@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <077115e4-8ec3-9c6d-0374-8ffc5e0f85c0@users.sourceforge.net>
In-Reply-To: <077115e4-8ec3-9c6d-0374-8ffc5e0f85c0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Borislav Petkov <bp@suse.de>, Chun-Yi Lee <joeyli.kernel@gmail.com>, Colin Ian King <colin.king@canonical.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Linda Knippers <linda.knippers@hpe.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony Luck <tony.luck@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 18:13:55 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/proc.c b/drivers/acpi/proc.c
index a34669cc823b..f17d5eb29609 100644
--- a/drivers/acpi/proc.c
+++ b/drivers/acpi/proc.c
@@ -23,7 +23,7 @@ acpi_system_wakeup_device_seq_show(struct seq_file *seq, void *offset)
 {
 	struct list_head *node, *next;
 
-	seq_printf(seq, "Device\tS-state\t  Status   Sysfs node\n");
+	seq_puts(seq, "Device\tS-state\t  Status   Sysfs node\n");
 
 	mutex_lock(&acpi_device_lock);
 	list_for_each_safe(node, next, &acpi_wakeup_device_list) {
@@ -55,7 +55,7 @@ acpi_system_wakeup_device_seq_show(struct seq_file *seq, void *offset)
 
 				if (&entry->node ! 						dev->physical_node_list.next)
-					seq_printf(seq, "\t\t");
+					seq_puts(seq, "\t\t");
 
 				seq_printf(seq, "%c%-8s  %s:%s\n",
 					dev->wakeup.flags.run_wake ? '*' : ' ',
-- 
2.12.2


