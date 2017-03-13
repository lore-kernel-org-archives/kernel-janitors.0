From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 13 Mar 2017 10:54:21 +0000
Subject: [PATCH] staging: atomisp: use k{v}zalloc instead of k{v}alloc and memset
Message-Id: <20170313105421.GA32342@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, alan@linux.intel.com, daeseok.youn@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If the atomisp_kernel_zalloc() has "true" as a second parameter, it
tries to allocate zeroing memory from kmalloc(vmalloc) and memset.
But using kzalloc is rather than kmalloc followed by memset with 0.
(vzalloc is for same reason with kzalloc)

And also atomisp_kernel_malloc() can be used with
atomisp_kernel_zalloc(<size>, false);

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
I think kvmalloc() or kvzalloc() can be used to allocate memory if there is
no reason to use vmalloc() when the requested bytes is over PAGE_SIZE.

 .../media/atomisp/pci/atomisp2/atomisp_cmd.c       | 25 ++++++++++++----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index d9a5c24..44b2244 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -86,32 +86,35 @@
 };
 
 /*
- * atomisp_kernel_malloc: chooses whether kmalloc() or vmalloc() is preferable.
+ * atomisp_kernel_malloc:
+ * allocating memory from atomisp_kernel_zalloc() without zeroing memory.
  *
  * It is also a wrap functions to pass into css framework.
  */
 void *atomisp_kernel_malloc(size_t bytes)
 {
-	/* vmalloc() is preferable if allocating more than 1 page */
-	if (bytes > PAGE_SIZE)
-		return vmalloc(bytes);
-
-	return kmalloc(bytes, GFP_KERNEL);
+	return atomisp_kernel_zalloc(bytes, false);
 }
 
 /*
- * atomisp_kernel_zalloc: chooses whether set 0 to the allocated memory.
+ * atomisp_kernel_zalloc: chooses whether set 0 to the allocated memory
+ * with k{z,m}alloc or v{z,m}alloc
  *
  * It is also a wrap functions to pass into css framework.
  */
 void *atomisp_kernel_zalloc(size_t bytes, bool zero_mem)
 {
-	void *ptr = atomisp_kernel_malloc(bytes);
+	/* vmalloc() is preferable if allocating more than 1 page */
+	if (bytes > PAGE_SIZE) {
+		if (zero_mem)
+			return vzalloc(bytes);
+		return vmalloc(bytes);
+	}
 
-	if (ptr && zero_mem)
-		memset(ptr, 0, bytes);
+	if (zero_mem)
+		return kzalloc(bytes, GFP_KERNEL);
 
-	return ptr;
+	return kmalloc(bytes, GFP_KERNEL);
 }
 
 /*
-- 
1.9.1

