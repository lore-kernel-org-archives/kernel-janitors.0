From: Matthew Martin <lihnucks@gmail.com>
Date: Wed, 08 Feb 2006 21:07:33 +0000
Subject: [KJ] [PATCH] Adding pci_set_drvdata() to /drivers/eisa/pci_eisa.c
Message-Id: <1139432853.7205.5.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6760923654097386=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139250553.9445.6.camel@localhost.localdomain>
In-Reply-To: <1139250553.9445.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============6760923654097386==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
Sorry the lines wrapped on my last email. Does anyone have any suggestions for
an email program? I'm using Evolution right now. I'm pretty sure the lines 
did not wrap this time.

Signed-off-by: Matthew Martin <lihnucks@gmail.com>

--- original-linux-2.6.15/drivers/eisa/pci_eisa.c	2006-01-02 21:21:10.000000000 -0600
+++ linux-2.6.15/drivers/eisa/pci_eisa.c	2006-02-06 12:14:48.000000000 -0600
@@ -31,7 +31,7 @@ static int __devinit pci_eisa_init (stru
 	}
 
 	pci_eisa_root.dev              = &pdev->dev;
-	pci_eisa_root.dev->driver_data = &pci_eisa_root;
+	pci_set_drvdata(pdev, &pci_eisa_root);
 	pci_eisa_root.res	       = pdev->bus->resource[0];
 	pci_eisa_root.bus_base_addr    = pdev->bus->resource[0]->start;
 	pci_eisa_root.slots	       = EISA_MAX_SLOTS;



--===============6760923654097386==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6760923654097386==--
