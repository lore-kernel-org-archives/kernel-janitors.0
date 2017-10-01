From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 01 Oct 2017 19:50:33 +0000
Subject: [PATCH 2/2] atm: Improve a size determination in adummy_init()
Message-Id: <80b86793-c590-7755-df8b-1d9394929120@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8fe2ca8a-e1f7-d492-db69-c52b66143ac6@users.sourceforge.net>
In-Reply-To: <8fe2ca8a-e1f7-d492-db69-c52b66143ac6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 1 Oct 2017 21:35:18 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/atm/adummy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/atm/adummy.c b/drivers/atm/adummy.c
index 94b73ddfb731..1ef2d8ee8d67 100644
--- a/drivers/atm/adummy.c
+++ b/drivers/atm/adummy.c
@@ -146,9 +146,7 @@ static int __init adummy_init(void)
 	int err = 0;
 
 	printk(KERN_ERR "adummy: version %s\n", DRV_VERSION);
-
-	adummy_dev = kzalloc(sizeof(struct adummy_dev),
-						   GFP_KERNEL);
+	adummy_dev = kzalloc(sizeof(*adummy_dev), GFP_KERNEL);
 	if (!adummy_dev) {
 		err = -ENOMEM;
 		goto out;
-- 
2.14.2

