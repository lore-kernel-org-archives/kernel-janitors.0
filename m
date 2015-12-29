From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Tue, 29 Dec 2015 13:24:53 +0000
Subject: [PATCH] resources: Remove unneeded initialization of local variable
Message-Id: <1451395493-22380-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: toshi.kani@hp.com, dan.j.williams@intel.com, akpm@linux-foundation.org, jsitnicki@gmail.com, jiang.liu@linux.intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bojan Prtvar <prtvar.b@gmail.com>

Few lines below dr is reinitialized by devres_alloc()
so we don't need to init it by NULL in the beginning of
__devm_request_region()

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 kernel/resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index f150dbb..1e48ede 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1356,7 +1356,7 @@ struct resource * __devm_request_region(struct device *dev,
 				struct resource *parent, resource_size_t start,
 				resource_size_t n, const char *name)
 {
-	struct region_devres *dr = NULL;
+	struct region_devres *dr;
 	struct resource *res;
 
 	dr = devres_alloc(devm_region_release, sizeof(struct region_devres),
-- 
2.4.1

