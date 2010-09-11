From: Dan Carpenter <error27@gmail.com>
Date: Sat, 11 Sep 2010 23:39:47 +0000
Subject: [patch] cciss: freeing uninitialized data on error path
Message-Id: <20100911233947.GC25351@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "h->scatter_list" is allocated inside a for loop.  If any of those
allocations fail, then the rest of the list is uninitialized data.  When
we free it we should start from the top and free backwards so that we
don't call kfree() on uninitialized pointers.

Also if the allocation for "h->scatter_list" fails then we would get an
Oops here.  I should have noticed this when I send: 4ee69851c "cciss:
handle allocation failure."  but I didn't.  Sorry about that.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 6124c2f..5e4fadc 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -4792,7 +4792,7 @@ static int __devinit cciss_init_one(struct pci_dev *pdev,
 clean4:
 	kfree(h->cmd_pool_bits);
 	/* Free up sg elements */
-	for (k = 0; k < h->nr_cmds; k++)
+	for (k-- ; k >= 0; k--)
 		kfree(h->scatter_list[k]);
 	kfree(h->scatter_list);
 	cciss_free_sg_chain_blocks(h->cmd_sg_list, h->nr_cmds);
