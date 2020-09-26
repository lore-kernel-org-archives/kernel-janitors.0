From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 26 Sep 2020 12:14:02 +0000
Subject: [PATCH v3] mm/hmm/test: use after free in dmirror_allocate_chunk()
Message-Id: <20200926121402.GA7467@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <d1b31586-426a-e0b1-803e-3eff30196c05@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Markus Elfring <Markus.Elfring@web.de>, Dan Williams <dan.j.williams@intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

Fixes: 1f9c4bb986d9 ("mm/memremap_pages: convert to 'struct range'")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
v2: The first version introduced a locking bug
v3: Markus Elfring pointed out that the Fixes tag was wrong.  This bug
was in the original commit and then fixed and then re-introduced.  I was
quite bothered by how this bug lasted so long in the source code, but
now we know.  As soon as it is introduced we fixed it.

One problem with the kernel QC process is that I think everyone marks
the bug as "old/dealt with" so it was only because I was added a new
check for resource leaks that it was found when it was re-introduced.

 lib/test_hmm.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c8133f50160b..e151a7f10519 100644
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
@@ -471,30 +487,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
 	if (IS_ERR(ptr))
-		goto err_free;
+		goto err_release;
 
 	devmem->mdevice = mdevice;
 	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
@@ -525,12 +525,12 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	return true;
 
-err_free:
-	kfree(devmem);
 err_release:
-	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
-err:
 	mutex_unlock(&mdevice->devmem_lock);
+	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
+err_devmem:
+	kfree(devmem);
+
 	return false;
 }
 
-- 
2.28.0
