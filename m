From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Feb 2006 05:13:34 +0000
Subject: [kj][Patch] remove implicit sign bit in
Message-Id: <1139375615.9409.25.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============051400564873770538=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139373686.9409.22.camel@localhost.localdomain>
In-Reply-To: <1139373686.9409.22.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============051400564873770538==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

Here is re-send of the last patch without line wrapping (my bad, got it
figured now)

http://linuxicc.sourceforge.net/

Warnings/Error while compiling with Intel C Compiler

Says there is a Warning #108: implictly-signed bit field of length 1

in drivers/media/video/videocodec.h @ line 225 - 232.

These fields seem to be used to keep track of how the polarity of bits
in registers work. So this patch converts them to unsigned.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>


--- linux-2.6.16-rc2/drivers/media/video/videocodec.h.orig	2006-02-08 15:29:21.000000000 +1100
+++ linux-2.6.16-rc2/drivers/media/video/videocodec.h	2006-02-08 15:30:42.000000000 +1100
@@ -222,14 +222,14 @@ M                       zr36055[1] 0001 
 /* ========================= */
 
 struct vfe_polarity {
-	int vsync_pol:1;
-	int hsync_pol:1;
-	int field_pol:1;
-	int blank_pol:1;
-	int subimg_pol:1;
-	int poe_pol:1;
-	int pvalid_pol:1;
-	int vclk_pol:1;
+	unsigned vsync_pol:1;
+	unsigned hsync_pol:1;
+	unsigned field_pol:1;
+	unsigned blank_pol:1;
+	unsigned subimg_pol:1;
+	unsigned poe_pol:1;
+	unsigned pvalid_pol:1;
+	unsigned vclk_pol:1;
 };
 
 struct vfe_settings {



--===============051400564873770538==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============051400564873770538==--
