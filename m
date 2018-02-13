From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 18:33:59 +0000
Subject: [PATCH 1/2] firewire: nosy: Delete an error message for a failed memory allocation in add_card()
Message-Id: <0b5d64ea-8305-de22-7fa7-e878045104ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c4e817a2-1554-2480-9469-9d06543b1eee@users.sourceforge.net>
In-Reply-To: <c4e817a2-1554-2480-9469-9d06543b1eee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 18:33:45 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/nosy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
index fee2e9e7ea20..6192f0718bf2 100644
--- a/drivers/firewire/nosy.c
+++ b/drivers/firewire/nosy.c
@@ -553,7 +553,6 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 
 	lynx = kzalloc(sizeof *lynx, GFP_KERNEL);
 	if (lynx = NULL) {
-		dev_err(&dev->dev, "Failed to allocate control structure\n");
 		ret = -ENOMEM;
 		goto fail_disable;
 	}
-- 
2.16.1

