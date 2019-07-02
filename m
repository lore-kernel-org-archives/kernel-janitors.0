From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 11:26:27 +0000
Subject: [PATCH] pci/proc: Use seq_puts() in show_device()
Message-Id: <a6b110cb-0d0e-5dc3-9ca1-9041609cf74c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 13:21:33 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pci/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 445b51db75b0..fe7fe678965b 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -377,7 +377,7 @@ static int show_device(struct seq_file *m, void *v)
 	}
 	seq_putc(m, '\t');
 	if (drv)
-		seq_printf(m, "%s", drv->name);
+		seq_puts(m, drv->name);
 	seq_putc(m, '\n');
 	return 0;
 }
--
2.22.0
