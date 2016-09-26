From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 15:42:11 +0000
Subject: [PATCH 3/5] ISDN-Gigaset: Delete an error message for a failed memory allocation
Message-Id: <64f7ba12-1b0e-9fac-9b2e-d22e7fb3fcc7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
In-Reply-To: <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 26 Sep 2016 15:35:47 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/isdn/gigaset/common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
index f505b42..c05a2a4 100644
--- a/drivers/isdn/gigaset/common.c
+++ b/drivers/isdn/gigaset/common.c
@@ -712,7 +712,6 @@ struct cardstate *gigaset_initcs(struct gigaset_driver *drv, int channels,
 	cs->bcs = kmalloc_array(channels, sizeof(*cs->bcs), GFP_KERNEL);
 	cs->inbuf = kmalloc(sizeof(*cs->inbuf), GFP_KERNEL);
 	if (!cs->bcs || !cs->inbuf) {
-		pr_err("out of memory\n");
 		goto error;
 	}
 	++cs->cs_init;
-- 
2.10.0

