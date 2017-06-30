From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 07:59:46 +0000
Subject: [PATCH] nvmem: core: remove unneeded NULL check
Message-Id: <20170630075946.3sstlbpgdxrydath@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"p" is the list iterator so it can't be NULL.  Static checkers complain
about this unnecessary check because we dereference the list iterator to
get the next item in the list so we'd be in trouble if it really was
NULL.  I have removed the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 4c49285168fb..f76916b936e1 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -290,7 +290,7 @@ static struct nvmem_cell *nvmem_find_cell(const char *cell_id)
 	mutex_lock(&nvmem_cells_mutex);
 
 	list_for_each_entry(p, &nvmem_cells, node)
-		if (p && !strcmp(p->name, cell_id)) {
+		if (!strcmp(p->name, cell_id)) {
 			mutex_unlock(&nvmem_cells_mutex);
 			return p;
 		}
