From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2020 10:55:54 +0000
Subject: [PATCH] nvmem: core: Fix a resource leak on error in nvmem_add_cells_from_of()
Message-Id: <X93cOvjVvzfig1Pu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This doesn't call of_node_put() on the error path so it leads to a
memory leak.

Fixes: 0749aa25af82 ("nvmem: core: fix regression in of_nvmem_cell_get()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The kfree_const() could just be replaced with kfree().  Someone got over
excited converting things from kfree() to kfree_const().

 drivers/nvmem/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 177f5bf27c6d..68ae6f24b57f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -713,6 +713,7 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
 				cell->name, nvmem->stride);
 			/* Cells already added will be freed later. */
 			kfree_const(cell->name);
+			of_node_put(cell->np);
 			kfree(cell);
 			return -EINVAL;
 		}
-- 
2.29.2
