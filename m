From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Aug 2012 08:44:17 +0000
Subject: [PATCH 1/14] drivers/rpmsg/virtio_rpmsg_bus.c: fix error return code
Message-Id: <1345365870-29831-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/rpmsg/virtio_rpmsg_bus.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 590cfaf..c5e66d9 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -959,8 +959,10 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
 				RPMSG_TOTAL_BUF_SPACE,
 				&vrp->bufs_dma, GFP_KERNEL);
-	if (!bufs_va)
+	if (!bufs_va) {
+		err = -ENOMEM;
 		goto vqs_del;
+	}
 
 	dev_dbg(&vdev->dev, "buffers: va %p, dma 0x%llx\n", bufs_va,
 					(unsigned long long)vrp->bufs_dma);

