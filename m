From: Felipe W Damasio <felipewd@terra.com.br>
Date: Mon, 27 Dec 2004 17:37:08 +0000
Subject: [KJ] [Fwd: PATCH: 2.6.10 - Incorrect return from PCI ide controller]
Message-Id: <41D04844.5060207@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68662607277341992=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68662607277341992==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Hi Guys,

	Maybe someone could look through the IDE drivers and see what can be done?

	Since the IDE party seems to be hosted by the -ac tree, submitting them 
for inclusion on that tree might be a good idea.

	Cheers,

Felipe Damasio

-------- Original Message --------
Subject: PATCH: 2.6.10 - Incorrect return from PCI ide controller
Date: Mon, 27 Dec 2004 14:37:38 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: torvalds@osdl.org,	Linux Kernel Mailing List 
<linux-kernel@vger.kernel.org>,	Bartlomiej Zolnierkiewicz 
<B.Zolnierkiewicz@elka.pw.edu.pl>

Several IDE drivers return positive values as errors in the PCI setup
code. Unfortunately the PCI layer considers positive values as success
so the driver skips the device but still claims it and things then go
downhill.

This fixes the IT8172 driver. There are other drivers with this bug (eg
generic) but the -ac IDE is sufficiently diverged from base that someone
else needs to generate/test the more divergent cases.

Alan

diff -u --new-file --recursive --exclude-from /usr/src/exclude 
linux.vanilla-2.6.10/drivers/ide/pci/it8172.c 
linux-2.6.10/drivers/ide/pci/it8172.c
--- linux.vanilla-2.6.10/drivers/ide/pci/it8172.c	2004-12-25 
21:15:34.000000000 +0000
+++ linux-2.6.10/drivers/ide/pci/it8172.c	2004-12-26 17:22:17.577730520 
+0000
@@ -270,7 +270,7 @@
  {
          if ((!(PCI_FUNC(dev->devfn) & 1) ||
              (!((dev->class >> 8) == PCI_CLASS_STORAGE_IDE))))
-                return 1; /* IT8172 is more than only a IDE controller */
+                return -EAGAIN; /* IT8172 is more than an IDE controller */
  	ide_setup_pci_device(dev, &it8172_chipsets[id->driver_data]);
  	return 0;
  }

--===============68662607277341992==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68662607277341992==--
