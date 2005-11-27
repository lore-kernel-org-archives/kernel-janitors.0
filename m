From: "Marion Jaillet" <marion.jaillet@wanadoo.fr>
Date: Sun, 27 Nov 2005 20:36:51 +0000
Subject: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <007001c5f392$4c61cda0$3ec0c756@bureau>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_006D_01C5F39A.ADB635C0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_006D_01C5F39A.ADB635C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Patch against linux-2.6.14.2

Signed-off-by : Christophe Jaillet

Desc : use kzalloc instead of kcalloc(1,...)

CJ
------=_NextPart_000_006D_01C5F39A.ADB635C0
Content-Type: application/octet-stream;
	name="patch1.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="patch1.c"

--- arch/ia64/sn/kernel/io_init.c.bak	2005-11-11 06:33:12.000000000 +0100=0A=
+++ arch/ia64/sn/kernel/io_init.c	2005-11-27 21:17:18.000000000 +0100=0A=
@@ -351,7 +351,7 @@ void sn_pci_controller_fixup(int segment=0A=
 		return;		/*bus # does not exist */=0A=
 	prom_bussoft_ptr =3D __va(prom_bussoft_ptr);=0A=
 =0A=
- 	controller =3D kcalloc(1,sizeof(struct pci_controller), GFP_KERNEL);=0A=
+ 	controller =3D kzalloc(sizeof(struct pci_controller), GFP_KERNEL);=0A=
 	controller->segment =3D segment;=0A=
  	if (!controller)=0A=
  		BUG();=0A=

------=_NextPart_000_006D_01C5F39A.ADB635C0
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_NextPart_000_006D_01C5F39A.ADB635C0--
