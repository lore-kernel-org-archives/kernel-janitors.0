From: "Luiz Fernando N. Capitulino" <lcapitulino@conectiva.com.br>
Date: Mon, 04 Oct 2004 16:18:51 +0000
Subject: [Kernel-janitors] [PATCH 2/3] - Module version info for CyberJack.
Message-Id: <20041004131851.342de617.lcapitulino@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56796927780945672=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56796927780945672==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


 Hi,

 Add module version information for drivers/usb/serial/cyberjack.c.


Signed-off-by: Luiz Capitulino <lcapitulino@conectiva.com.br>

 drivers/usb/serial/cyberjack.c |    1 +
 1 files changed, 1 insertion(+)


diff -X /home/lcapitulino/kernels/2.6/dontdiff -Nparu a/drivers/usb/serial/cyberjack.c a~/drivers/usb/serial/cyberjack.c
--- a/drivers/usb/serial/cyberjack.c	2004-09-17 19:18:28.000000000 -0300
+++ a~/drivers/usb/serial/cyberjack.c	2004-09-27 21:51:53.000000000 -0300
@@ -511,6 +511,7 @@ module_exit(cyberjack_exit);
 
 MODULE_AUTHOR( DRIVER_AUTHOR );
 MODULE_DESCRIPTION( DRIVER_DESC );
+MODULE_VERSION( DRIVER_VERSION );
 MODULE_LICENSE("GPL");
 
 module_param(debug, bool, S_IRUGO | S_IWUSR);

--===============56796927780945672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56796927780945672==--
