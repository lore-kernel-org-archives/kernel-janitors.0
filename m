From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sat, 17 Nov 2012 01:54:23 +0000
Subject: [PATCH] acpi_system_write_wakeup_device(): fix error check for unsigned variable.
Message-Id: <1353117263-6957-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, rjw@sisk.pl, lenb@kernel.org, kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>

The LEN variable is unsigned, therefore checking whether it is less than 0 is
useless.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/acpi/proc.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/acpi/proc.c b/drivers/acpi/proc.c
index 27adb09..37871a7 100644
--- a/drivers/acpi/proc.c
+++ b/drivers/acpi/proc.c
@@ -366,8 +366,6 @@ acpi_system_write_wakeup_device(struct file *file,
 
 	if (len > 4)
 		len = 4;
-	if (len < 0)
-		return -EFAULT;
 
 	if (copy_from_user(strbuf, buffer, len))
 		return -EFAULT;
-- 
1.7.10.4

