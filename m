From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:55 +0000
Subject: [KJ] [PATCH] [9/29] dma.c - vfree() checking cleanups
Message-Id: <41db1127.31d9ebf5.2568.07b6@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60482805973203124=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60482805973203124==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

dma.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 dma.c |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)


--- linux-2.6.10-vanilla/drivers/ieee1394/dma.c	2004-12-24 13:34:49.000000000 -0800
+++ linux-2.6.10/drivers/ieee1394/dma.c	2005-01-04 11:39:08.000000000 -0800
@@ -127,16 +127,12 @@
 		dma->dev  	}
 
-	if (dma->sglist) {
-		vfree(dma->sglist);
-		dma->sglist -	}
+	vfree(dma->sglist);
+	dma->sglist  
-	if (dma->kvirt) {
-		vfree(dma->kvirt);
-		dma->kvirt -		dma->n_pages -	}
+	vfree(dma->kvirt);
+	dma->kvirt +	dma->n_pages  }
 
 /* find the scatterlist index and remaining offset corresponding to a



--===============60482805973203124==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60482805973203124==--
