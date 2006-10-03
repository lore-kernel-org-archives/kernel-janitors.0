From: Kevin Lo <kevlo@kevlo.org>
Date: Tue, 03 Oct 2006 04:28:40 +0000
Subject: [KJ] [PATCH] check_/request_region fixes: sound/oss/pss.c
Message-Id: <1159849720.5147.8.camel@monet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-4DXucSYVAx/8BzPT6x0c"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-4DXucSYVAx/8BzPT6x0c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Attached patch is to get rid of check_region and replace with
request_region.

	Kevin

--=-4DXucSYVAx/8BzPT6x0c
Content-Disposition: attachment; filename=patch
Content-Type: text/plain; name=patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- linux-2.6.18/sound/oss/pss.c.orig	2006-10-03 11:51:18.000000000 +0800
+++ linux-2.6.18/sound/oss/pss.c	2006-10-03 12:05:54.000000000 +0800
@@ -677,7 +677,7 @@ static void configure_nonsound_component
 	{
 		printk(KERN_INFO "PSS: CDROM port not enabled.\n");
 	}
-	else if(check_region(pss_cdrom_port, 2))
+	else if(!request_region(pss_cdrom_port, 2, "PSS cdrom port"))
 	{
 		printk(KERN_ERR "PSS: CDROM I/O port conflict.\n");
 	}

--=-4DXucSYVAx/8BzPT6x0c
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-4DXucSYVAx/8BzPT6x0c--
