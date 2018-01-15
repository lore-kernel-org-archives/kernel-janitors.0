From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:15:36 +0000
Subject: [PATCH 2/3] mfd/sm501: Improve a size determination in two functions
Message-Id: <3b264527-b43f-b6aa-0570-c6d48ed24679@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
In-Reply-To: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:47:03 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/sm501.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 7298d6b571a1..d5ab3481794a 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1380,10 +1380,9 @@ static int sm501_init_dev(struct sm501_devdata *sm)
 
 static int sm501_plat_probe(struct platform_device *dev)
 {
-	struct sm501_devdata *sm;
 	int ret;
+	struct sm501_devdata *sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 
-	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
 	if (sm = NULL) {
 		ret = -ENOMEM;
 		goto err1;
@@ -1569,10 +1568,9 @@ static struct sm501_platdata sm501_pci_platdata = {
 static int sm501_pci_probe(struct pci_dev *dev,
 				     const struct pci_device_id *id)
 {
-	struct sm501_devdata *sm;
 	int err;
+	struct sm501_devdata *sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 
-	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
 	if (sm = NULL) {
 		err = -ENOMEM;
 		goto err1;
-- 
2.15.1

