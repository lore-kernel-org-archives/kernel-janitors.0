From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Oct 2015 06:41:22 +0000
Subject: [patch 1/2] misc: mic/scif: fix error code in scif_create_remote_lookup()
Message-Id: <20151009064122.GC7540@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikhil Rao <nikhil.rao@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be returning -ENOMEM here instead of success.

Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
index e288996..bc2dccb 100644
--- a/drivers/misc/mic/scif/scif_rma.c
+++ b/drivers/misc/mic/scif/scif_rma.c
@@ -386,16 +386,20 @@ static int scif_create_remote_lookup(struct scif_dev *remote_dev,
 				    remote_dev, window->nr_lookup *
 				    sizeof(*window->dma_addr_lookup.lookup),
 				    GFP_KERNEL | __GFP_ZERO);
-	if (!window->dma_addr_lookup.lookup)
+	if (!window->dma_addr_lookup.lookup) {
+		err = -ENOMEM;
 		goto error_window;
+	}
 
 	window->num_pages_lookup.lookup  		scif_alloc_coherent(&window->num_pages_lookup.offset,
 				    remote_dev, window->nr_lookup *
 				    sizeof(*window->num_pages_lookup.lookup),
 				    GFP_KERNEL | __GFP_ZERO);
-	if (!window->num_pages_lookup.lookup)
+	if (!window->num_pages_lookup.lookup) {
+		err = -ENOMEM;
 		goto error_window;
+	}
 
 	vmalloc_dma_phys = is_vmalloc_addr(&window->dma_addr[0]);
 	vmalloc_num_pages = is_vmalloc_addr(&window->num_pages[0]);
