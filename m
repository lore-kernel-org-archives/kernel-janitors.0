From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 27 May 2004 19:12:32 +0000
Subject: [Kernel-janitors] [PATCH] - fix pci/probe.c possible NULL pointer.
Message-Id: <20040527191232.GA2249@lorien.prodam>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69371189915671394=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69371189915671394==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


 Hi,

 In drivers/pci/probe.c::pci_scan_bridge() the call for pci_alloc_child_bus()
can return NULL, but it is not handled by the function (detected by
Coverity's checker).

 The patch bellow fix that returning `max' if we got the NULL, but
I do not know if it is right. I guess it is, because in that case
the function will act in the same way as with `pass != 0'.

Signed-off by: Luiz Capitulino <lcapitulino@prefeitura.sp.gov.br>

 drivers/pci/probe.c |    2 ++
 1 files changed, 2 insertions(+)


diff -X dontdiff -Nparu a/drivers/pci/probe.c a~/drivers/pci/probe.c
--- a/drivers/pci/probe.c	2004-05-24 14:44:34.000000000 -0300
+++ a~/drivers/pci/probe.c	2004-05-26 19:51:50.000000000 -0300
@@ -366,6 +366,8 @@ int __devinit pci_scan_bridge(struct pci
 			return max;
 		busnr = (buses >> 8) & 0xFF;
 		child = pci_alloc_child_bus(bus, dev, busnr);
+		if (!child)
+			return max;
 		child->primary = buses & 0xFF;
 		child->subordinate = (buses >> 16) & 0xFF;
 		child->bridge_ctl = bctl;
-- 
Luiz Fernando N. Capitulino
<http://www.telecentros.sp.gov.br>

--===============69371189915671394==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69371189915671394==--
