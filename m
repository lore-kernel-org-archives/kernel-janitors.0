From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 10:13:31 +0000
Subject: [Kernel-janitors] [patch] mark __init/__exit static
Message-Id: <20040524101331.GC1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84228824809220004=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84228824809220004==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

more static, applies clean on 2.6.7-rc1
compile tested

a++ maks


diff -X dontdiff -pruN linux-2.6.6/drivers/net/ppp_deflate.c linux-2.6.6-maks/drivers/net/ppp_deflate.c
--- linux-2.6.6/drivers/net/ppp_deflate.c	2004-03-16 08:47:07.000000000 +0100
+++ linux-2.6.6-maks/drivers/net/ppp_deflate.c	2004-05-12 00:00:34.000000000 +0200
@@ -636,7 +636,7 @@ struct compressor ppp_deflate_draft = {
 	.owner =		THIS_MODULE
 };
 
-int __init deflate_init(void)
+static int __init deflate_init(void)
 {  
         int answer = ppp_register_compressor(&ppp_deflate);
         if (answer == 0)
@@ -646,7 +646,7 @@ int __init deflate_init(void)
         return answer;
 }
      
-void __exit deflate_cleanup(void)
+static void __exit deflate_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_deflate);
 	ppp_unregister_compressor(&ppp_deflate_draft);


--===============84228824809220004==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84228824809220004==--
