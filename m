From: Amit Choudhary <amit2030@gmail.com>
Date: Fri, 06 Oct 2006 05:38:39 +0000
Subject: [KJ] [PATCH] sound/isa/gus/interwave.c: check kmalloc() return
Message-Id: <20061005223839.a635394a.amit2030@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function snd_interwave_pnp(), in file sound/isa/gus/interwave.c.

Signed-off-by: Amit Choudhary <amit2030@gmail.com>

diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index ea69f25..5282fbb 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -564,6 +564,8 @@ static int __devinit snd_interwave_pnp(i
 	struct pnp_resource_table * cfg = kmalloc(sizeof(struct pnp_resource_table), GFP_KERNEL);
 	int err;
 
+	if (!cfg)
+		return -ENOMEM;
 	iwcard->dev = pnp_request_card_device(card, id->devs[0].id, NULL);
 	if (iwcard->dev = NULL) {
 		kfree(cfg);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
