From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:47 +0000
Subject: [KJ] [PATCH] [5/29] av7110.c - vfree() checking cleanups
Message-Id: <41db111f.3e59ab34.2568.07b2@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077730109825850047=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============077730109825850047==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

av7110.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 av7110.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/ttpci/av7110.c	2004-12-24 13:35:01.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/ttpci/av7110.c	2005-01-04 11:34:06.000000000 -0800
@@ -2095,8 +2095,7 @@
 
 	if (NULL ! 		pci_free_consistent(dev->pci, 8192, av7110->debi_virt, av7110->debi_bus);
-	if (NULL !-		vfree(av7110->iobuf);
+	vfree(av7110->iobuf);
 	if (NULL ! 		kfree(av7110);
 	}
@@ -2139,8 +2138,7 @@
 
 	av7110_num--;
 #ifndef CONFIG_DVB_AV7110_FIRMWARE_FILE 
-	if (av7110->bin_fw)
-		vfree(av7110->bin_fw);
+	vfree(av7110->bin_fw);
 #endif
 	kfree (av7110);
 	saa->ext_priv 


--===============077730109825850047==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077730109825850047==--
