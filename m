From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:25:31 +0000
Subject: [PATCH v2] gnss: fix potential error pointer dereference
Message-Id: <20180703122531.5mgay63srlurlkvo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180703121143.GP9802@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The gnss_allocate_device() function returns a mix of NULL and error
pointers on error.  It should only return one or the other.  Since the
callers both check for NULL, I've modified it to return NULL on error.

Fixes: 2b6a44035143 ("gnss: add GNSS receiver subsystem")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Johan Hovold <johan@kernel.org>
---
v2: Use the correct Fixes tag.

diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index f30ef8338b3a..4291a0dd22aa 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -235,7 +235,7 @@ struct gnss_device *gnss_allocate_device(struct device *parent)
 	id = ida_simple_get(&gnss_minors, 0, GNSS_MINORS, GFP_KERNEL);
 	if (id < 0) {
 		kfree(gdev);
-		return ERR_PTR(id);
+		return NULL;
 	}
 
 	gdev->id = id;
@@ -270,7 +270,7 @@ struct gnss_device *gnss_allocate_device(struct device *parent)
 err_put_device:
 	put_device(dev);
 
-	return ERR_PTR(-ENOMEM);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(gnss_allocate_device);
 
