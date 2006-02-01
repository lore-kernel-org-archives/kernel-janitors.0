From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 00:28:07 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/media/
Message-Id: <1138753687.9742.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80311317008829186=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============80311317008829186==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-alsa.c.orig	2006-01-31 21:49:07.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-alsa.c	2006-01-31 21:49:18.000000000 +0100
@@ -306,8 +306,7 @@ static int dsp_buffer_init(struct saa713
 
 static int dsp_buffer_free(struct saa7134_dev *dev)
 {
-	if (!dev->dmasound.blksize)
-		BUG();
+	BUG_ON(!dev->dmasound.blksize);
 
 	videobuf_dma_free(&dev->dmasound.dma);
 
--- linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-oss.c.orig	2006-01-31 21:49:27.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-oss.c	2006-01-31 21:49:42.000000000 +0100
@@ -84,8 +84,7 @@ static int dsp_buffer_init(struct saa713
 {
 	int err;
 
-	if (!dev->dmasound.bufsize)
-		BUG();
+	BUG_ON(!dev->dmasound.bufsize);
 	videobuf_dma_init(&dev->dmasound.dma);
 	err = videobuf_dma_init_kernel(&dev->dmasound.dma, PCI_DMA_FROMDEVICE,
 				       (dev->dmasound.bufsize + PAGE_SIZE) >> PAGE_SHIFT);
@@ -96,8 +95,7 @@ static int dsp_buffer_init(struct saa713
 
 static int dsp_buffer_free(struct saa7134_dev *dev)
 {
-	if (!dev->dmasound.blksize)
-		BUG();
+	BUG_ON(!dev->dmasound.blksize);
 	videobuf_dma_free(&dev->dmasound.dma);
 	dev->dmasound.blocks  = 0;
 	dev->dmasound.blksize = 0;
--- linux-2.6.16-rc1-git4/drivers/media/video/bttv-risc.c.orig	2006-01-31 21:49:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/bttv-risc.c	2006-01-31 21:50:08.000000000 +0100
@@ -507,8 +507,7 @@ bttv_risc_hook(struct bttv *btv, int slo
 void
 bttv_dma_free(struct bttv *btv, struct bttv_buffer *buf)
 {
-	if (in_interrupt())
-		BUG();
+	BUG_ON(in_interrupt());
 	videobuf_waiton(&buf->vb,0,0);
 	videobuf_dma_pci_unmap(btv->c.pci, &buf->vb.dma);
 	videobuf_dma_free(&buf->vb.dma);
--- linux-2.6.16-rc1-git4/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c.orig	2006-01-31 21:42:27.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c	2006-01-31 21:42:38.000000000 +0100
@@ -689,8 +689,7 @@ static void ttusb_process_frame(struct t
 				memcpy(ttusb->muxpack + ttusb->muxpack_ptr,
 				       data, avail);
 				ttusb->muxpack_ptr += avail;
-				if (ttusb->muxpack_ptr > 264)
-					BUG();
+				BUG_ON(ttusb->muxpack_ptr > 264);
 				data += avail;
 				len -= avail;
 				/* determine length */
--- linux-2.6.16-rc1-git4/drivers/media/dvb/ttpci/av7110.c.orig	2006-01-31 21:42:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/dvb/ttpci/av7110.c	2006-01-31 21:43:24.000000000 +0100
@@ -1088,11 +1088,9 @@ static int dvb_get_stc(struct dmx_demux 
 	struct av7110 *av7110;
 
 	/* pointer casting paranoia... */
-	if (!demux)
-		BUG();
+	BUG_ON(!demux);
 	dvbdemux = (struct dvb_demux *) demux->priv;
-	if (!dvbdemux)
-		BUG();
+	BUG_ON(!dvbdemux);
 	av7110 = (struct av7110 *) dvbdemux->priv;
 
 	dprintk(4, "%p\n", av7110);
--- linux-2.6.16-rc1-git4/drivers/media/common/saa7146_fops.c.orig	2006-01-31 21:43:43.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/common/saa7146_fops.c	2006-01-31 21:44:06.000000000 +0100
@@ -37,8 +37,7 @@ void saa7146_res_free(struct saa7146_fh 
 	struct saa7146_dev *dev = fh->dev;
 	struct saa7146_vv *vv = dev->vv_data;
 
-	if ((fh->resources & bits) != bits)
-		BUG();
+	BUG_ON((fh->resources & bits) != bits);
 
 	down(&dev->lock);
 	fh->resources  &= ~bits;
@@ -55,8 +54,7 @@ void saa7146_dma_free(struct saa7146_dev
 {
 	DEB_EE(("dev:%p, buf:%p\n",dev,buf));
 
-	if (in_interrupt())
-		BUG();
+	BUG_ON(in_interrupt());
 
 	videobuf_waiton(&buf->vb,0,0);
 	videobuf_dma_pci_unmap(dev->pci, &buf->vb.dma);
--- linux-2.6.16-rc1-git4/drivers/media/common/saa7146_core.c.orig	2006-01-31 21:44:16.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/common/saa7146_core.c	2006-01-31 21:45:45.000000000 +0100
@@ -116,8 +116,7 @@ static struct scatterlist* vmalloc_to_sg
 		pg = vmalloc_to_page(virt);
 		if (NULL == pg)
 			goto err;
-		if (PageHighMem(pg))
-			BUG();
+		BUG_ON(PageHighMem(pg));
 		sglist[i].page   = pg;
 		sglist[i].length = PAGE_SIZE;
 	}
--- linux-2.6.16-rc1-git4/drivers/media/video/video-buf.c.orig	2006-01-31 21:46:05.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/video-buf.c	2006-01-31 21:46:28.000000000 +0100
@@ -59,8 +59,7 @@ videobuf_vmalloc_to_sg(unsigned char *vi
 		pg = vmalloc_to_page(virt);
 		if (NULL == pg)
 			goto err;
-		if (PageHighMem(pg))
-			BUG();
+		BUG_ON(PageHighMem(pg));
 		sglist[i].page   = pg;
 		sglist[i].length = PAGE_SIZE;
 	}
--- linux-2.6.16-rc1-git4/drivers/media/video/cx88/cx88-core.c.orig	2006-01-31 21:46:48.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/cx88/cx88-core.c	2006-01-31 21:46:58.000000000 +0100
@@ -215,8 +215,7 @@ int cx88_risc_stopper(struct pci_dev *pc
 void
 cx88_free_buffer(struct pci_dev *pci, struct cx88_buffer *buf)
 {
-	if (in_interrupt())
-		BUG();
+	BUG_ON(in_interrupt());
 	videobuf_waiton(&buf->vb,0,0);
 	videobuf_dma_pci_unmap(pci, &buf->vb.dma);
 	videobuf_dma_free(&buf->vb.dma);
--- linux-2.6.16-rc1-git4/drivers/media/video/cx88/cx88-video.c.orig	2006-01-31 21:47:11.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/cx88/cx88-video.c	2006-01-31 21:47:31.000000000 +0100
@@ -366,8 +366,7 @@ static
 void res_free(struct cx8800_dev *dev, struct cx8800_fh *fh, unsigned int bits)
 {
 	struct cx88_core *core = dev->core;
-	if ((fh->resources & bits) != bits)
-		BUG();
+	BUG_ON((fh->resources & bits) != bits);
 
 	down(&core->lock);
 	fh->resources  &= ~bits;
--- linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-video.c.orig	2006-01-31 21:48:05.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-video.c	2006-01-31 21:48:24.000000000 +0100
@@ -489,8 +489,7 @@ int res_locked(struct saa7134_dev *dev, 
 static
 void res_free(struct saa7134_dev *dev, struct saa7134_fh *fh, unsigned int bits)
 {
-	if ((fh->resources & bits) != bits)
-		BUG();
+	BUG_ON((fh->resources & bits) != bits);
 
 	down(&dev->lock);
 	fh->resources  &= ~bits;
--- linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-core.c.orig	2006-01-31 21:48:34.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/media/video/saa7134/saa7134-core.c	2006-01-31 21:48:44.000000000 +0100
@@ -251,8 +251,7 @@ void saa7134_pgtable_free(struct pci_dev
 
 void saa7134_dma_free(struct saa7134_dev *dev,struct saa7134_buf *buf)
 {
-	if (in_interrupt())
-		BUG();
+	BUG_ON(in_interrupt());
 
 	videobuf_waiton(&buf->vb,0,0);
 	videobuf_dma_pci_unmap(dev->pci, &buf->vb.dma);



--===============80311317008829186==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80311317008829186==--
