From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 15:25:30 +0000
Subject: [KJ] [Patch 2/2] BUG_ON() Conversion in input/serio/hp_sdc_mlc.c
Message-Id: <1138289130.8642.4.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68601009762439746=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68601009762439746==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/input/serio/hp_sdc_mlc.c.orig	2006-01-26 16:16:51.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/input/serio/hp_sdc_mlc.c	2006-01-26 16:17:42.000000000 +0100
@@ -270,9 +270,10 @@ static void hp_sdc_mlc_out (hil_mlc *mlc
 
  do_control:
 	priv->emtestmode = mlc->opacket & HIL_CTRL_TEST;
-	if ((mlc->opacket & (HIL_CTRL_APE | HIL_CTRL_IPF)) == HIL_CTRL_APE) {
-		BUG(); /* we cannot emulate this, it should not be used. */
-	}
+	
+	/* we cannot emulate this, it should not be used. */
+	BUG_ON((mlc->opacket & (HIL_CTRL_APE | HIL_CTRL_IPF)) == HIL_CTRL_APE);
+	
 	if ((mlc->opacket & HIL_CTRL_ONLY) == HIL_CTRL_ONLY) goto control_only;
 	if (mlc->opacket & HIL_CTRL_APE) { 
 		BUG(); /* Should not send command/data after engaging APE */



--===============68601009762439746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68601009762439746==--
