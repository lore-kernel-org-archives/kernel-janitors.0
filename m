From: Colin King <colin.king@canonical.com>
Date: Mon, 30 Mar 2020 10:19:01 +0000
Subject: [PATCH][next] virtio: fix spelling mistake "confiugration" -> "configuration"
Message-Id: <20200330101901.162407-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, tiwei.bie@intel.com, Wang Xiao <xiao.w.wang@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes of configuration in IFCVF_ERR error
messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/virtio/vdpa/ifcvf/ifcvf_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_main.c b/drivers/virtio/vdpa/ifcvf/ifcvf_main.c
index 8d54dc5b08d2..111ac12f6c8e 100644
--- a/drivers/virtio/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/virtio/vdpa/ifcvf/ifcvf_main.c
@@ -340,14 +340,14 @@ static int ifcvf_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
 	if (ret) {
-		IFCVF_ERR(pdev, "No usable DMA confiugration\n");
+		IFCVF_ERR(pdev, "No usable DMA configuration\n");
 		return ret;
 	}
 
 	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
 	if (ret) {
 		IFCVF_ERR(pdev,
-			  "No usable coherent DMA confiugration\n");
+			  "No usable coherent DMA configuration\n");
 		return ret;
 	}
 
-- 
2.25.1
