From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 04 Mar 2019 00:58:32 +0000
Subject: [PATCH -next] device-dax: Make function 'dev_dax_kmem_probe' static
Message-Id: <20190304011121.64398-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Keith Busch <keith.busch@intel.com>, Dave Jiang <dave.jiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org

Fixes the following sparse warning:

drivers/dax/kmem.c:17:5: warning:
 symbol 'dev_dax_kmem_probe' was not declared. Should it be static?

Fixes: c221c0b0308f ("device-dax: "Hotplug" persistent memory for use like normal RAM")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/dax/kmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index a02318c6d28a..e5cbbe22a19b 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -14,7 +14,7 @@
 #include "dax-private.h"
 #include "bus.h"
 
-int dev_dax_kmem_probe(struct device *dev)
+static int dev_dax_kmem_probe(struct device *dev)
 {
 	struct dev_dax *dev_dax = to_dev_dax(dev);
 	struct resource *res = &dev_dax->region->res;
