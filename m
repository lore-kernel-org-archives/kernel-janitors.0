From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 01:59:03 +0000
Subject: [PATCH net-next] virtio_net: fix error return code in virtnet_probe()
Message-Id: <1527732307-145609-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the failover create fail error
handling case instead of 0, as done elsewhere in this function.

Fixes: ba5e4426e80e ("virtio_net: Extend virtio to use VF datapath when available")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/virtio_net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 8f08a3e..2d55e2a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2935,8 +2935,10 @@ static int virtnet_probe(struct virtio_device *vdev)
 
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
 		vi->failover = net_failover_create(vi->dev);
-		if (IS_ERR(vi->failover))
+		if (IS_ERR(vi->failover)) {
+			err = PTR_ERR(vi->failover);
 			goto free_vqs;
+		}
 	}
 
 	err = register_netdev(dev);

