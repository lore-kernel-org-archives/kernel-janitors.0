From: yoonsoo@web.de
Date: Tue, 01 Jun 2004 10:00:47 +0000
Subject: [Kernel-janitors] [Patch] eisa_h driverdata access
Message-Id: <20040601100047.GA583@nlx.t-online.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34729579158919321=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040601001308.GA27070@nlx.t-online.de>
In-Reply-To: <20040601001308.GA27070@nlx.t-online.de>
To: kernel-janitors@vger.kernel.org

--===============34729579158919321==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

now with tabs I hope. 


diff -uprN -X dontdiff linux-2.6.6-orig/include/linux/eisa.h linux-2.6.6-new/include/linux/eisa.h
--- linux-2.6.6-orig/include/linux/eisa.h	2004-05-10 04:33:12.000000000 +0200
+++ linux-2.6.6-new/include/linux/eisa.h	2004-06-01 11:50:08.000000000 +0200
@@ -74,12 +74,12 @@ void eisa_driver_unregister (struct eisa
 /* Mimics pci.h... */
 static inline void *eisa_get_drvdata (struct eisa_device *edev)
 {
-        return edev->dev.driver_data;
+	return dev_get_drvdata(edev->dev);
 }
 
 static inline void eisa_set_drvdata (struct eisa_device *edev, void *data)
 {
-        edev->dev.driver_data = data;
+	dev_set_drvdata(edev->dev, data);
 }
 
 /* The EISA root device. There's rumours about machines with multiple

--===============34729579158919321==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34729579158919321==--
