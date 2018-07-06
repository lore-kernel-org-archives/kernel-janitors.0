From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2018 08:37:56 +0000
Subject: [PATCH] Staging: Gasket: uninitialized return in gasket_mmap()
Message-Id: <20180706083756.dc3dhl56omkwefll@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We forgot to set the error code on this error path so ret can be
uninitialized.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gasket/gasket_core.c b/drivers/staging/gasket/gasket_core.c
index 6511a33eb658..1f43c739a9ed 100644
--- a/drivers/staging/gasket/gasket_core.c
+++ b/drivers/staging/gasket/gasket_core.c
@@ -1719,8 +1719,10 @@ static int gasket_mmap(struct file *filp, struct vm_area_struct *vma)
 		/* Try the next region if this one was not mappable. */
 		if (map_status = DO_MAP_REGION_INVALID)
 			continue;
-		if (map_status = DO_MAP_REGION_FAILURE)
+		if (map_status = DO_MAP_REGION_FAILURE) {
+			ret = -ENOMEM;
 			goto fail;
+		}
 
 		has_mapped_anything = 1;
 	}
