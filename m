From: "Daniel E. Wilson" <danw@bureau-13.org>
Date: Wed, 30 Mar 2005 21:11:26 +0000
Subject: [KJ] [PATCH] Elimination of isa_read* and isa_write*.
Message-Id: <424B15FE.2000107@bureau-13.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch elimiates the use of isa_read* and isa_write* in the lance.c
file.

diff -Nru a/drivers/net/lance.c b/drivers/net/lance.c
--- a/drivers/net/lance.c       2005-03-30 12:57:53 -08:00
+++ b/drivers/net/lance.c       2005-03-30 12:57:53 -08:00
@@ -472,20 +472,24 @@
        static int did_version;                 /* Already printed
version info. */
        unsigned long flags;
        int err = -ENOMEM;
+       char __iomem *base_addr;                /* Base address in the
BIOS. */

        /* First we look for special cases.
           Check for HP's on-board ethernet by looking for 'HP' in the BIOS.
           There are two HP versions, check the BIOS for the
configuration port.
           This method provided by L. Julliard,
Laurent_Julliard@grenoble.hp.com.
           */
-       if (isa_readw(0x000f0102) = 0x5048)  {
+       base_addr = ioremap(0x000f0000, 0x104);
+       if (readw(base_addr + 0x102) = 0x5048)  {
                static const short ioaddr_table[] = { 0x300, 0x320,
0x340, 0x360};
-               int hp_port = (isa_readl(0x000f00f1) & 1)  ? 0x499 : 0x99;
+               int hp_port = (readl(base_addr + 0xf1) & 1)  ? 0x499 : 0x99;
                /* We can have boards other than the built-in!  Verify
this is on-board. */
                if ((inb(hp_port) & 0xc0) = 0x80
                        && ioaddr_table[inb(hp_port) & 3] = ioaddr)
                        hp_builtin = hp_port;
        }
+       iounmap(base_addr);
+
        /* We also recognize the HP Vectra on-board here, but check
below. */
        hpJ2405A = (inb(ioaddr) = 0x08 && inb(ioaddr+1) = 0x00
                                && inb(ioaddr+2) = 0x09);

-- 
Daniel E Wilson <danw@bureau-13.org>

The gods do not protect fools.
Fools are protected by more capable fools.
                 - Larry Niven

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
