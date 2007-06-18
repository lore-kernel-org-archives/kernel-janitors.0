From: Shani Moideen <shani.moideen@wipro.com>
Date: Mon, 18 Jun 2007 03:35:00 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <1182136980.9020.13.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>) 
in drivers/infiniband/hw/mthca/mthca_eq.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/infiniband/hw/mthca/mthca_eq.c b/drivers/infiniband/hw/mthca/mthca_eq.c
index 8ec9fa1..8592b26 100644
--- a/drivers/infiniband/hw/mthca/mthca_eq.c
+++ b/drivers/infiniband/hw/mthca/mthca_eq.c
@@ -522,7 +522,7 @@ static int mthca_create_eq(struct mthca_dev *dev,
 		dma_list[i] = t;
 		pci_unmap_addr_set(&eq->page_list[i], mapping, t);
 
-		memset(eq->page_list[i].buf, 0, PAGE_SIZE);
+		clear_page(eq->page_list[i].buf);
 	}
 
 	for (i = 0; i < eq->nent; ++i)


-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
