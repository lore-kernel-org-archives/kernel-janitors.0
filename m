From: Srdjan Todorovic <todorovic.s@googlemail.com>
Date: Sun, 18 Dec 2005 05:18:57 +0000
Subject: [KJ] [patch] initio: call scsi_unregister() in release function
Message-Id: <Pine.LNX.4.62.0512180510380.16721@tigerclaw.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94116233853185094=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94116233853185094==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Make the release function call scsi_unregister() to avoid having
exit_this_scsi_driver() call it and creating a stack dump. This
also makes the execution path in exit_this_scsi_driver() shorter
and cleaner.

Signed-off-by: Srdjan Todorovic <todorovic.s@googlemail.com>


diff -upr a/drivers/scsi/initio.c b/drivers/scsi/initio.c
--- a/drivers/scsi/initio.c	2005-11-24 22:10:21.000000000 +0000
+++ b/drivers/scsi/initio.c	2005-12-14 00:42:50.000000000 +0000
@@ -3151,6 +3151,7 @@ static int i91u_release(struct Scsi_Host
 {
 	free_irq(hreg->irq, hreg);
 	release_region(hreg->io_port, 256);
+	scsi_unregister(hreg);
 	return 0;
 }
 MODULE_LICENSE("Dual BSD/GPL");

--===============94116233853185094==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94116233853185094==--
