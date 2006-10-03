From: Amit Choudhary <amit2030@yahoo.com>
Date: Tue, 03 Oct 2006 07:56:07 +0000
Subject: [KJ] [PATCH] [RESEND] sound/isa/ad1816a/ad1816a.c: check kmalloc()
Message-Id: <20061003075607.32837.qmail@web55612.mail.re4.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: Check the return value of kmalloc() in function snd_card_ad1816a_pnp(), in file sound/isa/ad1816a/ad1816a.c.

Signed-off-by: Amit Choudhary <amit2030@yahoo.com>

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index b33a5fb..fab77ae 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -120,6 +120,8 @@ static int __devinit snd_card_ad1816a_pn
        struct pnp_resource_table *cfg = kmalloc(sizeof(*cfg), GFP_KERNEL);
        int err;

+       if(!cfg)
+               return -ENOMEM;
        acard->dev = pnp_request_card_device(card, id->devs[0].id, NULL);
        if (acard->dev = NULL) {
                kfree(cfg);



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
