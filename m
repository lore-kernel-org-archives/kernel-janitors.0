From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:30 +0000
Subject: [KJ] [PATCH][4/26] drivers/char/watchdog/* - compile warning cleanup
Message-Id: <420BEF86.27783.587B2F@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============412683903199206=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============412683903199206==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - add MODULE definition compile 
fence so MODULE_DEVICE_TABLE vars not declared when compiled into the 
kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/char/watchdog/alim1535_wdt.c linux-2.6.11-rc3-mm/drivers/char/watchdog/alim1535_wdt.c
--- linux-2.6.11-rc3-mm-original/drivers/char/watchdog/alim1535_wdt.c	2005-02-03 03:55:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/drivers/char/watchdog/alim1535_wdt.c	2005-02-07 15:38:11.000000000 +0200
@@ -307,6 +307,7 @@ static int ali_notify_sys(struct notifie
 	return NOTIFY_DONE;
 }
 
+#ifdef MODULE
 /*
  *	Data for PCI driver interface
  *
@@ -321,6 +322,7 @@ static struct pci_device_id ali_pci_tbl[
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ali_pci_tbl);
+#endif
 
 /*
  *	ali_find_watchdog	-	find a 1535 and 7101




--===============412683903199206==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============412683903199206==--
