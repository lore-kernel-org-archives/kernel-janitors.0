From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 24 Jun 2005 08:52:03 +0000
Subject: [KJ] [PATCH] Balanced io{re|un}map : drivers/char/moxa.c
Message-Id: <20050624085203.GF5023@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54622457822531545=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54622457822531545==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

description:
Balancing functions: io{re|un}map here.
Make sure calls to certain functions are matched by the relevant function 
at other end of the function, and also during ALL failure/early return paths.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

diff -urpN -X dontdiff 2.6.12-orig/drivers/char/moxa.c 2.6.12/drivers/char/moxa.c
--- 2.6.12-orig/drivers/char/moxa.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/char/moxa.c	2005-06-24 09:52:40.321457432 +0200
@@ -492,6 +492,10 @@ static void __exit moxa_exit(void)
 	if (tty_unregister_driver(moxaDriver))
 		printk("Couldn't unregister MOXA Intellio family serial driver\n");
 	put_tty_driver(moxaDriver);
+	for (i = 0; i < numBoards; i++) {
+		iounmap((void __iomem *) moxaBaseAddr[i]);
+	}
+
 	if (verbose)
 		printk("Done\n");
 }

--===============54622457822531545==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54622457822531545==--
