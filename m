From: Olivier Kaloudoff <kalou@kalou.net>
Date: Sun, 10 Apr 2005 21:23:15 +0000
Subject: [KJ] ioremap() / iounmap() balancing problem in scoop_probe() ?
Message-Id: <Pine.LNX.4.61.0504102318150.15064@s1.ckr-solutions.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43820198271653288=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43820198271653288==
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hi,


 	following the advice of Bertl, I'm trying my first error
report about the scoop device driver for arm, kernel 2.6.11.5;

 	I found that scoop_io_base is only used in scoop.c (once),
so after use, the memory area should be freed;


root@nec:/usr/src/linux/arch/arm/common# diff -Naur scoop.c.orig scoop.c
--- scoop.c.orig        2005-04-10 23:17:06.000000000 +0200
+++ scoop.c     2005-04-10 23:17:28.000000000 +0200
@@ -107,6 +107,7 @@
         scoop_io_base = ioremap(mem->start, 0x1000);
         if (!scoop_io_base)
                 return -ENOMEM;
+       iounmap(scoop_io_base);

         SCOOP_REG(SCOOP_MCR) = 0x0140;


 	Am I right ?


Olivier

--===============43820198271653288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43820198271653288==--
