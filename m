From: =?koi8-r?Q?=22?=Alexey Dobriyan=?koi8-r?Q?=22=20?=<adobriyan@mail.ru>
Date: Fri, 16 Apr 2004 15:09:17 +0000
Subject: [Kernel-janitors] [PATCH] Kill a warning while making pdfdocs.
Message-Id: <E1BEUxx-0009Wu-00.adobriyan-mail-ru@f24.mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23051331279461706=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23051331279461706==
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit

  DOCPROC Documentation/DocBook/parportbook.sgml
Warning(drivers/parport/share.c:188): No description found for parameter 'drv'

Alexey

--- a/drivers/parport/share.c   2004-04-16 19:08:58.000000000 +0400
+++ b/drivers/parport/share.c   2004-04-16 19:09:47.000000000 +0400
@@ -169,7 +169,7 @@

 /**
  *     parport_unregister_driver - deregister a parallel port device driver
- *     @arg: structure describing the driver that was given to
+ *     @drv: structure describing the driver that was given to
  *           parport_register_driver()
  *
  *     This should be called by a parallel port device driver that


--===============23051331279461706==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23051331279461706==--
