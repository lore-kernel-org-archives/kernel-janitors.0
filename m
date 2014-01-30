From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:55:15 +0000
Subject: [patch] ACPI / proc: remove unneeded NULL check
Message-Id: <20140130115515.GF12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

We already verified that "ldev" was non-NULL earlier and also we
dereference again without checking a three lines later.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/proc.c b/drivers/acpi/proc.c
index 50fe34ffe932..75c28eae8860 100644
--- a/drivers/acpi/proc.c
+++ b/drivers/acpi/proc.c
@@ -60,7 +60,7 @@ acpi_system_wakeup_device_seq_show(struct seq_file *seq, void *offset)
 				seq_printf(seq, "%c%-8s  %s:%s\n",
 					dev->wakeup.flags.run_wake ? '*' : ' ',
 					(device_may_wakeup(&dev->dev) ||
-					(ldev && device_may_wakeup(ldev))) ?
+					device_may_wakeup(ldev)) ?
 					"enabled" : "disabled",
 					ldev->bus ? ldev->bus->name :
 					"no-bus", dev_name(ldev));
