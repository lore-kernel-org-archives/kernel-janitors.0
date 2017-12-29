From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 11:47:11 +0000
Subject: [PATCH] pci/setup-bus: Delete an error message for a failed memory allocation in add_to_list()
Message-Id: <fd9d212e-e8da-1aa7-be7f-7bf6d8f1e15f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 29 Dec 2017 12:15:16 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pci/setup-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index b1ad466199ad..d131d29c4fdb 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -67,10 +67,8 @@ static int add_to_list(struct list_head *head,
 	struct pci_dev_resource *tmp;
 
 	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
-	if (!tmp) {
-		pr_warn("add_to_list: kmalloc() failed!\n");
+	if (!tmp)
 		return -ENOMEM;
-	}
 
 	tmp->res = res;
 	tmp->dev = dev;
-- 
2.15.1

