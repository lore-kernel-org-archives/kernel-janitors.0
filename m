From: "Luiz Fernando N. Capitulino" <lcapitulino@conectiva.com.br>
Date: Mon, 04 Oct 2004 16:18:40 +0000
Subject: [Kernel-janitors] [PATCH 1/3] - Module version info for PL2303.
Message-Id: <20041004131840.03aa2b9f.lcapitulino@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42845558286686569=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42845558286686569==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


 Hi,

 Add module version information for usb/serial/pl2303.c.


Signed-off-by: Luiz Capitulino <lcapitulino@conectiva.com.br>

 drivers/usb/serial/pl2303.c |    1 +
 1 files changed, 1 insertion(+)


diff -X /home/lcapitulino/kernels/2.6/dontdiff -Nparu a/drivers/usb/serial/pl2303.c a~/drivers/usb/serial/pl2303.c
--- a/drivers/usb/serial/pl2303.c	2004-09-17 19:18:29.000000000 -0300
+++ a~/drivers/usb/serial/pl2303.c	2004-09-25 17:16:56.000000000 -0300
@@ -865,6 +865,7 @@ module_init(pl2303_init);
 module_exit(pl2303_exit);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
 
 module_param(debug, bool, S_IRUGO | S_IWUSR);

--===============42845558286686569==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42845558286686569==--
