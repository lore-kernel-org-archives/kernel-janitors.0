From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Jan 2021 14:52:35 +0000
Subject: [PATCH][next] vpda: Fix memory leaks of msg on error return paths
Message-Id: <20210122145235.209121-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>, Eli Cohen <elic@nvidia.com>, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two error return paths that neglect to free the allocated
object msg that lead to memory leaks. Fix this by adding an error
exit path that frees msg.

Addresses-Coverity: ("Resource leak")
Fixes: 39502d042a70 ("vdpa: Enable user to query vdpa device info")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/vdpa/vdpa.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 9700a0adcca0..eb1f5a514103 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -540,13 +540,15 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
 	if (!dev) {
 		mutex_unlock(&vdpa_dev_mutex);
 		NL_SET_ERR_MSG_MOD(info->extack, "device not found");
-		return -ENODEV;
+		err = -ENODEV;
+		goto err;
 	}
 	vdev = container_of(dev, struct vdpa_device, dev);
 	if (!vdev->mdev) {
 		mutex_unlock(&vdpa_dev_mutex);
 		put_device(dev);
-		return -EINVAL;
+		err = -EINVAL;
+		goto err;
 	}
 	err = vdpa_dev_fill(vdev, msg, info->snd_portid, info->snd_seq, 0, info->extack);
 	if (!err)
@@ -554,6 +556,7 @@ static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
 	put_device(dev);
 	mutex_unlock(&vdpa_dev_mutex);
 
+err:
 	if (err)
 		nlmsg_free(msg);
 	return err;
-- 
2.29.2
