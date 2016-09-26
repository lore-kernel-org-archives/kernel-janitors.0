From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 15:40:04 +0000
Subject: [PATCH 2/5] ISDN-Gigaset: Improve another size determination in gigaset_initcs()
Message-Id: <f62d162b-02fe-02a3-c587-f5bdd59760cb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
In-Reply-To: <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 22:32:14 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/gigaset/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
index cecbb6a..f505b42 100644
--- a/drivers/isdn/gigaset/common.c
+++ b/drivers/isdn/gigaset/common.c
@@ -710,7 +710,7 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 	cs->mode = M_UNKNOWN;
 	cs->mstate = MS_UNINITIALIZED;
 	cs->bcs = kmalloc_array(channels, sizeof(*cs->bcs), GFP_KERNEL);
-	cs->inbuf = kmalloc(sizeof(struct inbuf_t), GFP_KERNEL);
+	cs->inbuf = kmalloc(sizeof(*cs->inbuf), GFP_KERNEL);
 	if (!cs->bcs || !cs->inbuf) {
 		pr_err("out of memory\n");
 		goto error;
-- 
2.10.0

