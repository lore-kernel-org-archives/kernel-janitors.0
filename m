From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:12:38 +0000
Subject: [PATCH v2 05/17 1/2] mfd: sm501: Improve a size determination in two functions
Message-Id: <8141262d-a76d-3085-5502-647f9fd3edfc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
 <5271ab9f-3be1-035c-90c1-8faba2e119b8@users.sourceforge.net>
In-Reply-To: <5271ab9f-3be1-035c-90c1-8faba2e119b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Mar 2018 14:05:41 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a different source code layout for this transformation.
The change was rebased on source files from Linux next-20180308.

 drivers/mfd/sm501.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 7298d6b571a1..4f4957ea8fa3 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1383,7 +1383,7 @@ static int sm501_plat_probe(struct platform_device *dev)
 	struct sm501_devdata *sm;
 	int ret;
 
-	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
+	sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 	if (sm = NULL) {
 		ret = -ENOMEM;
 		goto err1;
@@ -1572,7 +1572,7 @@ static int sm501_pci_probe(struct pci_dev *dev,
 	struct sm501_devdata *sm;
 	int err;
 
-	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
+	sm = kzalloc(sizeof(*sm), GFP_KERNEL);
 	if (sm = NULL) {
 		err = -ENOMEM;
 		goto err1;
-- 
2.16.2

