From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 15 May 2005 18:22:21 +0000
Subject: [KJ] [UPDATE PATCH 3/3] Remove duplicate file in
Message-Id: <20050515182221.GE792@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17132340524631529=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17132340524631529==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

wanpipe.txt and wan-router.txt in Documentation/networking
contain the exact same information (diff between the two shows no
difference). This patch removes the reference to this document in
drivers/net/wan/Kconfig.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc4/drivers/net/wan/Kconfig linux-2.6.12-rc4-tk/drivers/net/wan/Kconfig
--- linux-2.6.12-rc4/drivers/net/wan/Kconfig	2005-05-07 21:53:53.000000000 +0200
+++ linux-2.6.12-rc4-tk/drivers/net/wan/Kconfig	2005-05-15 20:05:37.811177776 +0200
@@ -435,7 +435,7 @@ config VENDOR_SANGOMA
 	  the driver to support.
 
 	  If you have one or more of these cards, say M to this option;
-	  and read <file:Documentation/networking/wanpipe.txt>.
+	  and read <file:Documentation/networking/wan-router.txt>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called wanpipe.

--===============17132340524631529==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17132340524631529==--
