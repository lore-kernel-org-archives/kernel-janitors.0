From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:37 +0000
Subject: [KJ] [PATCH] [RESEND] [5/29] av7110.c - vfree() checking cleanups
Message-Id: <auto-000001227481@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23253604359356927=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23253604359356927==

av7110.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 av7110.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/ttpci/av7110.c	2004-12-24 13:35:01.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/ttpci/av7110.c	2005-01-04 11:34:06.000000000 -0800
@@ -2095,8 +2095,7 @@
 
 	if (NULL != av7110->debi_virt)
 		pci_free_consistent(dev->pci, 8192, av7110->debi_virt, av7110->debi_bus);
-	if (NULL != av7110->iobuf)
-		vfree(av7110->iobuf);
+	vfree(av7110->iobuf);
 	if (NULL != av7110 ) {
 		kfree(av7110);
 	}
@@ -2139,8 +2138,7 @@
 
 	av7110_num--;
 #ifndef CONFIG_DVB_AV7110_FIRMWARE_FILE 
-	if (av7110->bin_fw)
-		vfree(av7110->bin_fw);
+	vfree(av7110->bin_fw);
 #endif
 	kfree (av7110);
 	saa->ext_priv = NULL;


--===============23253604359356927==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23253604359356927==--
