From: Vicente Feito <vicente.feito@gmail.com>
Date: Fri, 04 Feb 2005 11:42:58 +0000
Subject: [KJ][PATCH]sound/oss/msnd_pinnacle.c:replace [const]char *s="" by
Message-Id: <200502041142.58572.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94754646783753071=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94754646783753071==
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline

Hi,
Please consider applying.
Thank you.

Description: Replaces char *s = "" with char s[] = "".

Signed-off-by: Vicente Feito <vicente.feito@gmail.com>

--- linux-2.6.10-orig/sound/oss/msnd_pinnacle.c 2005-02-04 02:09:11.000000000 +0000
+++ linux-2.6.10/sound/oss/msnd_pinnacle.c      2005-02-04 09:17:52.000000000 +0000
@@ -1141,8 +1141,8 @@ static int __init probe_multisound(void)
 {
 #ifndef MSND_CLASSIC
        char *xv, *rev = NULL;
-       char *pin = "Pinnacle", *fiji = "Fiji";
-       char *pinfiji = "Pinnacle/Fiji";
+       char pin[] = "Pinnacle", fiji[] = "Fiji";
+       char pinfiji[] = "Pinnacle/Fiji";
 #endif

        if (!request_region(dev.io, dev.numio, "probing")) {


--===============94754646783753071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94754646783753071==--
