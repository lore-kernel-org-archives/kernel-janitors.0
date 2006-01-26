From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 21:02:49 +0000
Subject: [KJ] [Patch 2/3] BUG_ON() Conversion in net/tulip/winbond-840.c
Message-Id: <1138309369.26201.5.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91686427946467863=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91686427946467863==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/net/tulip/winbond-840.c.orig	2006-01-26 20:31:30.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/net/tulip/winbond-840.c	2006-01-26 20:33:11.000000000 +0100
@@ -1645,7 +1645,7 @@ static int w840_suspend (struct pci_dev 
 
 		/* no more hardware accesses behind this line. */
 
-		if (np->csr6) BUG();
+		BUG_ON(np->csr6);
 		if (ioread32(ioaddr + IntrEnable)) BUG();
 
 		/* pci_power_off(pdev, -1); */



--===============91686427946467863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91686427946467863==--
