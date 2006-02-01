From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 15:13:10 +0000
Subject: [KJ] [Patch 4/4] ide cleanups - remove unneeded BUG_ON()
Message-Id: <1138806790.22662.27.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58452573298465826=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58452573298465826==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

according to Bartlomiej we dont need this BUG_ON,
since it is too late in the initialisation sequence.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c.orig	2006-02-01 15:52:52.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/ide/ide-dma.c	2006-02-01 15:53:10.000000000 +0100
@@ -945,8 +945,6 @@ void ide_setup_dma (ide_hwif_t *hwif, un
 		       hwif->drives[1].name, (dma_stat & 0x40) ? "DMA" : "pio");
 	}
 	printk("\n");
-
-	BUG_ON(!(hwif->dma_master));
 }
 
 EXPORT_SYMBOL_GPL(ide_setup_dma);



--===============58452573298465826==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58452573298465826==--
