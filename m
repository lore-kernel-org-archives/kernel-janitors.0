From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 10:14:10 +0000
Subject: [Kernel-janitors] [patch] mark __init/__exit static
Message-Id: <20040524101410.GD1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21096145378416598=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524101331.GC1949@sputnik.stro.at>
In-Reply-To: <20040524101331.GC1949@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============21096145378416598==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

more static
aplies cleanly on 2.6.7-rc1, compile tested

a++ maks

diff -X dontdiff -pruN linux-2.6.6/drivers/net/bsd_comp.c linux-2.6.6-maks/drivers/net/bsd_comp.c
--- linux-2.6.6/drivers/net/bsd_comp.c	2004-03-16 08:47:06.000000000 +0100
+++ linux-2.6.6-maks/drivers/net/bsd_comp.c	2004-05-11 18:31:06.000000000 +0200
@@ -1160,7 +1160,7 @@ static struct compressor ppp_bsd_compres
  * Module support routines
  *************************************************************/
 
-int __init bsdcomp_init(void)
+static int __init bsdcomp_init(void)
 {
 	int answer = ppp_register_compressor(&ppp_bsd_compress);
 	if (answer == 0)
@@ -1168,7 +1168,7 @@ int __init bsdcomp_init(void)
 	return answer;
 }
 
-void __exit bsdcomp_cleanup(void)
+static void __exit bsdcomp_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_bsd_compress);
 }

--===============21096145378416598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21096145378416598==--
