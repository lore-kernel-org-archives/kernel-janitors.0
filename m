From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:08:28 +0000
Subject: [PATCH 09] drivers/char/consolemap.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311908.28679.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/char/consolemap.c | 22678 -> 22650 (-28 bytes)
 drivers/char/consolemap.o | 90113 -> 90029 (-84 bytes)

 drivers/char/consolemap.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/char/consolemap.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/char/consolemap.c	2007-07-31 11:24:24.000000000 +0200
@@ -494,12 +494,11 @@ int con_clear_unimap(struct vc_data *vc,
 	p = (struct uni_pagedir *)*vc->vc_uni_pagedir_loc;
 	if (p && p->readonly) return -EIO;
 	if (!p || --p->refcount) {
-		q = kmalloc(sizeof(*p), GFP_KERNEL);
+		q = kzalloc(sizeof(*p), GFP_KERNEL);
 		if (!q) {
 			if (p) p->refcount++;
 			return -ENOMEM;
 		}
-		memset(q, 0, sizeof(*q));
 		q->refcount=1;
 		*vc->vc_uni_pagedir_loc = (unsigned long)q;
 	} else {
