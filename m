From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 14 Mar 2005 20:06:47 +0000
Subject: [KJ] [PATCH] drivers/scsi/lasi700.c: Use the DMA_32BIT_MASK constant
Message-Id: <20050314200647.GC1887@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41682812662165536=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41682812662165536==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_32BIT_MASK constants from dma-mapping.h
when calling dma_set_mask().

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/scsi/lasi700.c	2005-03-02 12:50:37.000000000 +0100
+++ linux-2.6.11/drivers/scsi/lasi700.c	2005-03-10 18:19:39.000000000 +0100
@@ -111,7 +111,7 @@ lasi700_probe(struct parisc_device *dev)
 	memset(hostdata, 0, sizeof(struct NCR_700_Host_Parameters));
 
 	hostdata->dev = &dev->dev;
-	dma_set_mask(&dev->dev, 0xffffffffUL);
+	dma_set_mask(&dev->dev, DMA_32BIT_MASK);
 	hostdata->base = base;
 	hostdata->differential = 0;
 

--===============41682812662165536==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41682812662165536==--
