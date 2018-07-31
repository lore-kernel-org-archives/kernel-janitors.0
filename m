From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Jul 2018 14:02:25 +0000
Subject: [PATCH][next] xen/gntdev: don't dereference a null gntdev_dmabuf on allocation failure
Message-Id: <20180731140225.22717-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the allocation of gntdev_dmabuf fails, the error exit
path will call dmabuf_imp_free_storage and causes a null pointer
dereference on gntdev_dmabuf.  Fix this by adding an error exit path
that won't free gntdev_dmabuf.

Detected by CoverityScan, CID#1472124 ("Dereference after null check")

Fixes: bf8dc55b1358 ("xen/gntdev: Implement dma-buf import functionality")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/gntdev-dmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 744cfe9b0311..cba6b586bfbd 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -568,7 +568,7 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 
 	gntdev_dmabuf = kzalloc(sizeof(*gntdev_dmabuf), GFP_KERNEL);
 	if (!gntdev_dmabuf)
-		goto fail;
+		goto fail_no_free;
 
 	gntdev_dmabuf->u.imp.refs = kcalloc(count,
 					    sizeof(gntdev_dmabuf->u.imp.refs[0]),
@@ -591,6 +591,7 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 
 fail:
 	dmabuf_imp_free_storage(gntdev_dmabuf);
+fail_no_free:
 	return ERR_PTR(-ENOMEM);
 }
 
-- 
2.17.1

