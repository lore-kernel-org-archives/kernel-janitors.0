From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 21 Oct 2004 18:25:45 +0000
Subject: [KJ] [PATCH 2.6] drm_drv.h: replace pci_find_device
Message-Id: <258330000.1098383145@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88350343147920718=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, dri-devel@lists.sourceforge.net

--===============88350343147920718==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device.
for_each_pci_dev is a macro wrapper around pci_get_device.
If someone with this hardware could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9cln/drivers/char/drm/drm_drv.h linux-2.6.9patch2/drivers/char/drm/drm_drv.h
--- linux-2.6.9cln/drivers/char/drm/drm_drv.h	2004-10-18 16:35:52.000000000 -0700
+++ linux-2.6.9patch2/drivers/char/drm/drm_drv.h	2004-10-20 14:51:17.000000000 -0700
@@ -556,9 +556,8 @@ static int __init drm_init( void )
 
 	DRM(mem_init)();
 
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	for_each_pci_dev(pdev) 
 		DRM(probe)(pdev);
-	}
 	return 0;
 }
 


--===============88350343147920718==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88350343147920718==--
