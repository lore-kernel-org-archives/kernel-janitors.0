From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:02 +0000
Subject: [KJ] [PATCH] [12/29] dmxdev.c - vfree() checking cleanups
Message-Id: <41db112e.44ef9e18.2568.07b9@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58939900475108731=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58939900475108731==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

dmxdev.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 dmxdev.c |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/dvb-core/dmxdev.c	2004-12-24 13:35:23.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/dvb-core/dmxdev.c	2005-01-04 11:36:27.000000000 -0800
@@ -304,8 +304,7 @@
 	buf->size 	buf->pwrite�->pread 	spin_unlock_irq(&dmxdevfilter->dev->lock);
-	if (mem) 
-		vfree(mem);
+	vfree(mem);
 		
 	if (buf->size) {
 		mem@@ -1123,14 +1122,10 @@
 {
 	dvb_unregister_device(dmxdev->dvbdev);
 	dvb_unregister_device(dmxdev->dvr_dvbdev);
-	if (dmxdev->filter) {
-		vfree(dmxdev->filter);
-		dmxdev->filter-	}
-	if (dmxdev->dvr) {
-		vfree(dmxdev->dvr);
-		dmxdev->dvr-	}
+	vfree(dmxdev->filter);
+	dmxdev->filter+	vfree(dmxdev->dvr);
+	dmxdev->dvr 	dmxdev->demux->close(dmxdev->demux);
 }
 EXPORT_SYMBOL(dvb_dmxdev_release);



--===============58939900475108731==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58939900475108731==--
