From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 May 2012 15:56:41 +0000
Subject: [patch] [media] videobuf-dma-contig: use gfp_t for GFP flags
Message-Id: <20120524155641.GA11037@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Federico Vaga <federico.vaga@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains if about using unsigned long.
videobuf-dma-contig.c:47:67: warning: restricted gfp_t degrades to integer
videobuf-dma-contig.c:47:65: warning: incorrect type in argument 2 (different base types)
videobuf-dma-contig.c:47:65:    expected restricted gfp_t [usertype] gfp_mask
videobuf-dma-contig.c:47:65:    got unsigned long

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/videobuf-dma-contig.c b/drivers/media/video/videobuf-dma-contig.c
index b6b5cc1..9b9a06f 100644
--- a/drivers/media/video/videobuf-dma-contig.c
+++ b/drivers/media/video/videobuf-dma-contig.c
@@ -40,7 +40,7 @@ struct videobuf_dma_contig_memory {
 
 static int __videobuf_dc_alloc(struct device *dev,
 			       struct videobuf_dma_contig_memory *mem,
-			       unsigned long size, unsigned long flags)
+			       unsigned long size, gfp_t flags)
 {
 	mem->size = size;
 	if (mem->cached) {
