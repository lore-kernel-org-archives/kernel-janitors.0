From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 20:24:03 +0000
Subject: [KJ] Re: ifdef typos: arch_ppc_platforms_prep_setup.c -another one
Message-Id: <20041124202403.GA16797@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49434327932340749=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49434327932340749==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Found another typo in the same file :-)

Obvious typo, FB_VGA16 is from Kconfig.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc/platforms/prep_setup.c	2004-10-19 13:52:48.000000000 +0200
+++ str2/arch/ppc/platforms/prep_setup.c	2004-11-24 20:44:14.000000000 +0100
@@ -645,7 +645,7 @@ static void __init prep_init_sound(void)
 static void __init
 prep_init_vesa(void)
 {
-#if     (defined(CONFIG_FB_VGA16) || defined(CONFIG_FB_VGA_16_MODULE) || \
+#if     (defined(CONFIG_FB_VGA16) || defined(CONFIG_FB_VGA16_MODULE) || \
 	 defined(CONFIG_FB_VESA))
 	PPC_DEVICE *vgadev = NULL;
 

--===============49434327932340749==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49434327932340749==--
