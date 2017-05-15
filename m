From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:27:58 +0000
Subject: [PATCH 2/4] pcmcia: pd6729: Delete an error message for a failed memory allocation in pd6729_pci_pro
Message-Id: <6f241ada-c3a4-2dc1-206a-ead47de4214e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
In-Reply-To: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:44:23 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pd6729.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index 289a5e74e852..a723ffbbd691 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -632,7 +632,5 @@ static int pd6729_pci_probe(struct pci_dev *dev,
-	if (!socket) {
-		dev_warn(&dev->dev, "failed to kzalloc socket.\n");
+	if (!socket)
 		return -ENOMEM;
-	}
 
 	ret = pci_enable_device(dev);
 	if (ret) {
-- 
2.13.0

