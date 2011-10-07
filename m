From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Oct 2011 13:24:53 +0000
Subject: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <20111007132453.GA31424@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These lines break if "data" is NULL.
	if (data[thr].thr)
		kthread_stop(data[thr].thr);
I rearranged it so the checks for NULL in the error handling code
aren't needed anymore.  And anyway both vfree() and free_page()
handle NULL pointers so the checks were redundant.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index d692842..32a17e0 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -528,15 +528,14 @@ static int save_image_lzo(struct swap_map_handle *handle,
 	page = (void *)__get_free_page(__GFP_WAIT | __GFP_HIGH);
 	if (!page) {
 		printk(KERN_ERR "PM: Failed to allocate LZO page\n");
-		ret = -ENOMEM;
-		goto out_clean;
+		return -ENOMEM;
 	}
 
 	data = vmalloc(sizeof(*data) * nr_threads);
 	if (!data) {
 		printk(KERN_ERR "PM: Failed to allocate LZO data\n");
 		ret = -ENOMEM;
-		goto out_clean;
+		goto out_page;
 	}
 	for (thr = 0; thr < nr_threads; thr++)
 		memset(&data[thr], 0, offsetof(struct cmp_data, go));
@@ -664,8 +663,9 @@ out_clean:
 		if (data[thr].thr)
 			kthread_stop(data[thr].thr);
 	}
-	if (data) vfree(data);
-	if (page) free_page((unsigned long)page);
+	vfree(data);
+out_page:
+	free_page((unsigned long)page);
 
 	return ret;
 }
@@ -978,15 +978,14 @@ static int load_image_lzo(struct swap_map_handle *handle,
 	page = vmalloc(sizeof(*page) * LZO_READ_PAGES);
 	if (!page) {
 		printk(KERN_ERR "PM: Failed to allocate LZO page\n");
-		error = -ENOMEM;
-		goto out_clean;
+		return -ENOMEM;
 	}
 
 	data = vmalloc(sizeof(*data) * nr_threads);
 	if (!data) {
 		printk(KERN_ERR "PM: Failed to allocate LZO data\n");
 		error = -ENOMEM;
-		goto out_clean;
+		goto out_page;
 	}
 	for (thr = 0; thr < nr_threads; thr++)
 		memset(&data[thr], 0, offsetof(struct dec_data, go));
@@ -1183,8 +1182,9 @@ out_clean:
 		if (data[thr].thr)
 			kthread_stop(data[thr].thr);
 	}
-	if (data) vfree(data);
-	if (page) vfree(page);
+	vfree(data);
+out_page:
+	vfree(page);
 
 	return error;
 }
