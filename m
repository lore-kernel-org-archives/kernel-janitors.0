From: Shani Moideen <shani.moideen@wipro.com>
Date: Mon, 18 Jun 2007 03:28:41 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <1182136601.9020.7.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>) 
in drivers/infiniband/hw/mthca/mthca_allocator.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/infiniband/hw/mthca/mthca_allocator.c b/drivers/infiniband/hw/mthca/mthca_allocator.c
index f930e55..a763067 100644
--- a/drivers/infiniband/hw/mthca/mthca_allocator.c
+++ b/drivers/infiniband/hw/mthca/mthca_allocator.c
@@ -255,7 +255,7 @@ int mthca_buf_alloc(struct mthca_dev *dev, int size, int max_direct,
 			dma_list[i] = t;
 			pci_unmap_addr_set(&buf->page_list[i], mapping, t);
 
-			memset(buf->page_list[i].buf, 0, PAGE_SIZE);
+			clear_page(buf->page_list[i].buf);
 		}
 	}


-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
