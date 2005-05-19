From: Travis Spencer <travislspencer@gmail.com>
Date: Thu, 19 May 2005 05:56:16 +0000
Subject: [KJ] [PATCH 2.6.12-rc3] Supress warning caused by label being
Message-Id: <e3b7bac0505182256a031ea8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

When the macro `__ISAPNP__' is undefined, the label `ready' is defined
but the only corresponding goto statement isn't .  This results in a
warning from the compiler.  To avoid this message, a `goto ready'
statement is added _just_ above the label.  Thus, when `__ISAPNP__'
isn't defined, the newly added `goto ready' is a noop and the compiler
is quiet.

Signed-off-by: Travis L. Spencer <tspencer@cs.pdx.edu>

--- drivers/isdn/hisax/diva.c~  2005-05-18 22:34:44.074178000 -0700
+++ drivers/isdn/hisax/diva.c   2005-05-18 22:33:26.745944000 -0700
@@ -1101,6 +1101,7 @@ setup_diva(struct IsdnCard *card)
                        bytecnt = 32;
                }
        }
+      goto ready; /* Assure that `ready' is used even if `__ISAPNP__' isn't. */
 ready:
        printk(KERN_INFO
                "Diva: %s card configured at %#lx IRQ %d\n",

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
