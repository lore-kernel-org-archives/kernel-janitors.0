From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:41 +0000
Subject: [KJ] [PATCH] [RESEND] [9/29] dma.c - vfree() checking cleanups
Message-Id: <auto-000001227485@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39676857387608333=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39676857387608333==

dma.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 dma.c |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)


--- linux-2.6.10-vanilla/drivers/ieee1394/dma.c	2004-12-24 13:34:49.000000000 -0800
+++ linux-2.6.10/drivers/ieee1394/dma.c	2005-01-04 11:39:08.000000000 -0800
@@ -127,16 +127,12 @@
 		dma->dev = NULL;
 	}
 
-	if (dma->sglist) {
-		vfree(dma->sglist);
-		dma->sglist = NULL;
-	}
+	vfree(dma->sglist);
+	dma->sglist = NULL;
 
-	if (dma->kvirt) {
-		vfree(dma->kvirt);
-		dma->kvirt = NULL;
-		dma->n_pages = 0;
-	}
+	vfree(dma->kvirt);
+	dma->kvirt = NULL;
+	dma->n_pages = 0;
 }
 
 /* find the scatterlist index and remaining offset corresponding to a


--===============39676857387608333==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39676857387608333==--
