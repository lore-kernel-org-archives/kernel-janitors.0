From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:29:34 +0000
Subject: [KJ] [patch 3/8] ifdef typos:
Message-Id: <20041124152934.GC14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59151950365460926=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59151950365460926==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CONFIG_HS7751RVOIP_CIDEC is mistyped.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/sh/boards/renesas/hs7751rvoip/io.c	2004-08-17 11:44:59.000000000 +0200
+++ str2/arch/sh/boards/renesas/hs7751rvoip/io.c	2004-11-24 14:51:30.000000000 +0100
@@ -166,7 +166,7 @@ void hs7751rvoip_outb(unsigned char valu
 
         if (PXSEG(port))
                 *(volatile unsigned char *)port = value;
-#if defined(CONFIG_HS7751RVOIP_CIDEC)
+#if defined(CONFIG_HS7751RVOIP_CODEC)
 	else if (codec_port(port))
 		*(volatile unsigned cjar *)((unsigned long)area6_io8_base+(port-CODEC_IO_BASE)) = value;
 #endif
@@ -180,7 +180,7 @@ void hs7751rvoip_outb_p(unsigned char va
 {
         if (PXSEG(port))
                 *(volatile unsigned char *)port = value;
-#if defined(CONFIG_HS7751RVOIP_CIDEC)
+#if defined(CONFIG_HS7751RVOIP_CODEC)
 	else if (codec_port(port))
 		*(volatile unsigned cjar *)((unsigned long)area6_io8_base+(port-CODEC_IO_BASE)) = value;
 #endif

--===============59151950365460926==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59151950365460926==--
