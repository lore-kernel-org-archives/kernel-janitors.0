From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:34:29 +0000
Subject: [patch] libnvdimm, namespace: potential NULL deref on allocation error
Message-Id: <20161012063429.GA13780@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-nvdimm-y27Ovi1pjclAfugRpC6u6w@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If the kcalloc() fails then "devs" can be NULL and we dereference it
checking "devs[i]".

Fixes: 1b40e09a1232 ('libnvdimm: blk labels and namespace instantiation')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 3509cff..abe5c6b 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -2176,12 +2176,14 @@ static struct device **scan_labels(struct nd_region *nd_region)
 	return devs;
 
  err:
-	for (i = 0; devs[i]; i++)
-		if (is_nd_blk(&nd_region->dev))
-			namespace_blk_release(devs[i]);
-		else
-			namespace_pmem_release(devs[i]);
-	kfree(devs);
+	if (devs) {
+		for (i = 0; devs[i]; i++)
+			if (is_nd_blk(&nd_region->dev))
+				namespace_blk_release(devs[i]);
+			else
+				namespace_pmem_release(devs[i]);
+		kfree(devs);
+	}
 	return NULL;
 }
 
