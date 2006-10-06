From: Amit Choudhary <amit2030@gmail.com>
Date: Fri, 06 Oct 2006 05:47:18 +0000
Subject: [KJ]  [PATCH] sound/isa/cmi8330.c: check kmalloc() return value.
Message-Id: <20061005224718.c369c7d2.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function snd_cmi8330_pnp(), in file sound/isa/cmi8330.c.

Signed-off-by: Amit Choudhary <amit2030@gmail.com>

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index 3c1e9fd..d1f6dfc 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -289,6 +289,8 @@ static int __devinit snd_cmi8330_pnp(int
 	struct pnp_resource_table * cfg = kmalloc(sizeof(struct pnp_resource_table), GFP_KERNEL);
 	int err;
 
+	if (!cfg)
+		return -ENOMEM;
 	acard->cap = pnp_request_card_device(card, id->devs[0].id, NULL);
 	if (acard->cap = NULL) {
 		kfree(cfg);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
