From: anton.ivanov@cambridgegreys.com
Date: Thu, 28 Nov 2019 17:44:05 +0000
Subject: [PATCH] um: vector: fix BPF loading in vector drivers
Message-Id: <20191128174405.4244-1-anton.ivanov@cambridgegreys.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-um@lists.infradead.org
Cc: richard@nod.at, dan.carpenter@oracle.com, weiyongjun1@huawei.com, kernel-janitors@vger.kernel.org, songliubraving@fb.com, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, kafai@fb.com, Anton Ivanov <anton.ivanov@cambridgegreys.com>

From: Anton Ivanov <anton.ivanov@cambridgegreys.com>

This fixes a possible hang in bpf firmware loading in the
UML vector io drivers due to use of GFP_KERNEL while holding
a spinlock.

Based on a prposed fix by weiyongjun1@huawei.com and suggestions for
improving it by dan.carpenter@oracle.com

Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
---
 arch/um/drivers/vector_kern.c | 38 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 92617e16829e..dbbc6e850fdd 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1387,6 +1387,7 @@ static int vector_net_load_bpf_flash(struct net_device *dev,
 	struct vector_private *vp = netdev_priv(dev);
 	struct vector_device *vdevice;
 	const struct firmware *fw;
+	void *new_filter;
 	int result = 0;
 
 	if (!(vp->options & VECTOR_BPF_FLASH)) {
@@ -1394,6 +1395,15 @@ static int vector_net_load_bpf_flash(struct net_device *dev,
 		return -1;
 	}
 
+	vdevice = find_device(vp->unit);
+
+	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
+		return -1;
+
+	new_filter = kmemdup(fw->data, fw->size, GFP_KERNEL);
+	if (!new_filter)
+		goto free_buffer;
+
 	spin_lock(&vp->lock);
 
 	if (vp->bpf != NULL) {
@@ -1402,41 +1412,33 @@ static int vector_net_load_bpf_flash(struct net_device *dev,
 		kfree(vp->bpf->filter);
 		vp->bpf->filter = NULL;
 	} else {
-		vp->bpf = kmalloc(sizeof(struct sock_fprog), GFP_KERNEL);
+		vp->bpf = kmalloc(sizeof(struct sock_fprog), GFP_ATOMIC);
 		if (vp->bpf = NULL) {
 			netdev_err(dev, "failed to allocate memory for firmware\n");
-			goto flash_fail;
+			goto apply_flash_fail;
 		}
 	}
 
-	vdevice = find_device(vp->unit);
-
-	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
-		goto flash_fail;
-
-	vp->bpf->filter = kmemdup(fw->data, fw->size, GFP_KERNEL);
-	if (!vp->bpf->filter)
-		goto free_buffer;
-
+	vp->bpf->filter = new_filter;
 	vp->bpf->len = fw->size / sizeof(struct sock_filter);
-	release_firmware(fw);
 
 	if (vp->opened)
 		result = uml_vector_attach_bpf(vp->fds->rx_fd, vp->bpf);
 
 	spin_unlock(&vp->lock);
 
-	return result;
-
-free_buffer:
 	release_firmware(fw);
 
-flash_fail:
+	return result;
+
+apply_flash_fail:
 	spin_unlock(&vp->lock);
-	if (vp->bpf != NULL)
+	if (vp->bpf)
 		kfree(vp->bpf->filter);
 	kfree(vp->bpf);
-	vp->bpf = NULL;
+
+free_buffer:
+	release_firmware(fw);
 	return -1;
 }
 
-- 
2.20.1
