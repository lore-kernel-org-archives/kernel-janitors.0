From: Amit Choudhary <amit2030@yahoo.com>
Date: Tue, 03 Oct 2006 06:37:07 +0000
Subject: [KJ] [PATCH] sound/isa/ad1816a/ad1816a.c: check kmalloc() return
Message-Id: <20061003063707.19051.qmail@web55614.mail.re4.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function
snd_card_ad1816a_pnp(), in file sound/isa/ad1816a/ad1816a.c.

Signed-off-by: Amit Choudhary <amit2030@yahoo.com>

diff --git a/sound/isa/ad1816a/ad1816a.c
b/sound/isa/ad1816a/ad1816a.c
index b33a5fb..16daaed 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -120,6 +120,8 @@ static int __devinit snd_card_ad1816a_pn
 	struct pnp_resource_table *cfg = kmalloc(sizeof(*cfg),
GFP_KERNEL);
 	int err;
 
+	if(!cfg)
+		return -ENOMEM;
 	acard->dev = pnp_request_card_device(card, id->devs[0].id,
NULL);
 	if (acard->dev = NULL) {
 		kfree(cfg);



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
