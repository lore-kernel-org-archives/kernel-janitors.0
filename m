From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2020 08:12:34 +0000
Subject: [PATCH] mm/hmm/test: use after free in dmirror_allocate_chunk()
Message-Id: <20200922081234.GA1274646@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Wei Yongjun <weiyongjun1@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling code does this:

err_free:
	kfree(devmem);
        ^^^^^^^^^^^^^
err_release:
	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
                           ^^^^^^^^
The problem is that when we use "devmem->pagemap.range.start" the
"devmem" pointer is either NULL or freed.

Neither the allocation nor the call to request_free_mem_region() has to
be done under the lock so I moved those to the start of the function.

Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
It's weird that I didn't catch the use after free when this code was
merged in May...  My bad.  Not sure what happened there.  How I found
this was that I have been reviewing release_mem_region() leaks and the
NULL dereference path is a leak.


 lib/test_hmm.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c8133f50160b..0503c78cb322 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -459,6 +459,22 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_last;
 	void *ptr;
 
+	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
+	if (!devmem)
+		return -ENOMEM;
+
+	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
+				      "hmm_dmirror");
+	if (IS_ERR(res))
+		goto err_devmem;
+
+	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	devmem->pagemap.range.start = res->start;
+	devmem->pagemap.range.end = res->end;
+	devmem->pagemap.nr_range = 1;
+	devmem->pagemap.ops = &dmirror_devmem_ops;
+	devmem->pagemap.owner = mdevice;
+
 	mutex_lock(&mdevice->devmem_lock);
 
 	if (mdevice->devmem_count = mdevice->devmem_capacity) {
@@ -471,30 +487,16 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 				sizeof(new_chunks[0]) * new_capacity,
 				GFP_KERNEL);
 		if (!new_chunks)
-			goto err;
+			goto err_release;
 		mdevice->devmem_capacity = new_capacity;
 		mdevice->devmem_chunks = new_chunks;
 	}
 
-	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
-					"hmm_dmirror");
-	if (IS_ERR(res))
-		goto err;
-
-	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
-	if (!devmem)
-		goto err_release;
-
-	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	devmem->pagemap.range.start = res->start;
-	devmem->pagemap.range.end = res->end;
-	devmem->pagemap.nr_range = 1;
-	devmem->pagemap.ops = &dmirror_devmem_ops;
-	devmem->pagemap.owner = mdevice;
-
 	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR(ptr))
-		goto err_free;
+	if (IS_ERR(ptr)) {
+		mutex_unlock(&mdevice->devmem_lock);
+		goto err_release;
+	}
 
 	devmem->mdevice = mdevice;
 	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
@@ -525,12 +527,11 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	return true;
 
-err_free:
-	kfree(devmem);
 err_release:
 	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
-err:
-	mutex_unlock(&mdevice->devmem_lock);
+err_devmem:
+	kfree(devmem);
+
 	return false;
 }
 
-- 
2.28.0
