From: "Luiz Fernando N. Capitulino" <lcapitulino@conectiva.com.br>
Date: Mon, 04 Oct 2004 16:19:01 +0000
Subject: [Kernel-janitors] [PATCH 3/3] - Module version info for Belkin_sa.
Message-Id: <20041004131901.1c8ca820.lcapitulino@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63501646688724378=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63501646688724378==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


 Hi,

 Add module version information for usb/serial/belkin_sa.c.


Signed-off-by: Luiz Capitulino <lcapitulino@conectiva.com.br>

 drivers/usb/serial/belkin_sa.c |    1 +
 1 files changed, 1 insertion(+)


diff -X /home/lcapitulino/kernels/2.6/dontdiff -Nparu a/drivers/usb/serial/belkin_sa.c a~/drivers/usb/serial/belkin_sa.c
--- a/drivers/usb/serial/belkin_sa.c	2004-08-14 02:37:14.000000000 -0300
+++ a~/drivers/usb/serial/belkin_sa.c	2004-09-25 17:27:57.000000000 -0300
@@ -607,6 +607,7 @@ module_exit (belkin_sa_exit);
 
 MODULE_AUTHOR( DRIVER_AUTHOR );
 MODULE_DESCRIPTION( DRIVER_DESC );
+MODULE_VERSION( DRIVER_VERSION );
 MODULE_LICENSE("GPL");
 
 module_param(debug, bool, S_IRUGO | S_IWUSR);

--===============63501646688724378==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63501646688724378==--
