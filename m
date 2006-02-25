From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 00:27:18 +0000
Subject: [KJ] Duplicated request_region code in arch/powerpc and arch/ppc
Message-Id: <200602250127.18815.tim@aapopfiets.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40013113695617125=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40013113695617125==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

These files all request the same regions, namely dma1, dma2, dma page reg, 
pic1, pic2 and timer:

arch/powerpc/platforms/chrp/setup.c
arch/powerpc/platforms/pseries/pci.c
arch/ppc/platforms/chrp_setup.c
arch/ppc/platforms/lopec.c
arch/ppc/platforms/mvme5100.c
arch/ppc/platforms/pplus.c
arch/ppc/platforms/sandpoint.c

Should these requests be moved to a central function?  If so, what should the 
function be called (i.e., why are the regions requested) and where should it 
be defined?

Tim

--===============40013113695617125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40013113695617125==--
