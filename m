From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Oct 2016 11:41:18 +0000
Subject: [PATCH 1/5] [media] winbond-cir: Use kmalloc_array() in wbcir_tx()
Message-Id: <74b439c6-fa6f-1f78-424a-ebeb6c8bbb4f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
In-Reply-To: <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Oct 2016 07:19:00 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/winbond-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 95ae60e..59050f5 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -660,7 +660,7 @@ wbcir_tx(struct rc_dev *dev, unsigned *b, unsigned count)
 	unsigned i;
 	unsigned long flags;
 
-	buf = kmalloc(count * sizeof(*b), GFP_KERNEL);
+	buf = kmalloc_array(count, sizeof(*b), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.10.1

