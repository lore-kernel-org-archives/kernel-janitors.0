From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 14:28:31 +0000
Subject: [patch] [media] v4l: xilinx: missing error code
Message-Id: <20150624142831.GB1702@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Michal Simek <michal.simek@xilinx.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We should set "ret" on this error path instead of returning success.

Fixes: df3305156f98 ('[media] v4l: xilinx: Add Xilinx Video IP core')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 98e50e4..e779c93 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -699,8 +699,10 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 
 	/* ... and the buffers queue... */
 	dma->alloc_ctx = vb2_dma_contig_init_ctx(dma->xdev->dev);
-	if (IS_ERR(dma->alloc_ctx))
+	if (IS_ERR(dma->alloc_ctx)) {
+		ret = PTR_ERR(dma->alloc_ctx);
 		goto error;
+	}
 
 	/* Don't enable VB2_READ and VB2_WRITE, as using the read() and write()
 	 * V4L2 APIs would be inefficient. Testing on the command line with a
