From: Armin Schindler <armin@melware.de>
Date: Tue, 08 Feb 2005 12:11:41 +0000
Subject: Re: [KJ] [PATCH] drivers/isdn/hardware/eicon/*: convert to
Message-Id: <Pine.LNX.4.61.0502081309200.22211@phoenix.one.melware.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3874643977417116=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050208084617.GI31996@rhum.iomeda.fr>
In-Reply-To: <20050208084617.GI31996@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============3874643977417116==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

who is sending/committing those patches to BK tree?

Armin

On Tue, 8 Feb 2005, Christophe Lucas wrote:
Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
Signed-off-by: Armin Schindler <armin@melware.de> 


diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/eicon/divasmain.c linux-2.6.11-rc3/drivers/isdn/hardware/eicon/divasmain.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/eicon/divasmain.c	2005-02-03 17:03:46.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/hardware/eicon/divasmain.c	2005-02-07 09:39:27.000000000 +0100
@@ -823,7 +823,7 @@ static int DIVA_INIT_FUNCTION divas_init
 		goto out;
 	}
 
-	if ((ret = pci_module_init(&diva_pci_driver))) {
+	if ((ret = pci_register_driver(&diva_pci_driver))) {
 #ifdef MODULE
 		remove_divas_proc();
 		divas_unregister_chrdev();
 

--===============3874643977417116==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3874643977417116==--
