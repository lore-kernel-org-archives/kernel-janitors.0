From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 19:44:06 +0000
Subject: [PATCH 2/3] [media] fsl-viu: Improve two size determinations in viu_of_probe()
Message-Id: <44462eba-a9dd-2af7-b187-9607fe8dc1ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bf912679-c695-c9c0-a464-3bd3e976fa8a@users.sourceforge.net>
In-Reply-To: <bf912679-c695-c9c0-a464-3bd3e976fa8a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Geliang Tang <geliangtang@gmail.com>, Hans Verkuil <hansverk@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 21:12:52 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/fsl-viu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 526f80649864..1fe2a295db93 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -1421,5 +1421,5 @@ static int viu_of_probe(struct platform_device *op)
 	}
 
 	/* remap registers */
-	viu_regs = devm_ioremap(&op->dev, r.start, sizeof(struct viu_reg));
+	viu_regs = devm_ioremap(&op->dev, r.start, sizeof(*viu_regs));
 	if (!viu_regs) {
@@ -1429,5 +1429,5 @@ static int viu_of_probe(struct platform_device *op)
 	}
 
 	/* Prepare our private structure */
-	viu_dev = devm_kzalloc(&op->dev, sizeof(struct viu_dev), GFP_ATOMIC);
+	viu_dev = devm_kzalloc(&op->dev, sizeof(*viu_dev), GFP_ATOMIC);
 	if (!viu_dev) {
-- 
2.14.1

