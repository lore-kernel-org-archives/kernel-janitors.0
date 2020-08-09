From: Eli Cohen <elic@nvidia.com>
Date: Sun, 09 Aug 2020 06:34:04 +0000
Subject: RE: [PATCH] vdpa/mlx5: Fix pointer math in mlx5_vdpa_get_config()
Message-Id: <BN8PR12MB3425E1FCC3E20A04182640D2AB470@BN8PR12MB3425.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200808093241.GB115053@mwanda>
In-Reply-To: <20200808093241.GB115053@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Acked-by: Eli Cohen <elic@nvidia.com>

BTW, vdpa_sim has the same bug.

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com> 
Sent: Saturday, August 8, 2020 12:33 PM
To: Michael S. Tsirkin <mst@redhat.com>; Eli Cohen <eli@mellanox.com>
Cc: Jason Wang <jasowang@redhat.com>; Parav Pandit <parav@mellanox.com>; virtualization@lists.linux-foundation.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: [PATCH] vdpa/mlx5: Fix pointer math in mlx5_vdpa_get_config()

There is a pointer math bug here so if "offset" is non-zero then this will copy memory from beyond the end of the array.

Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 3ec44a4f0e45..9d1637cf772e 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1758,7 +1758,7 @@ static void mlx5_vdpa_get_config(struct vdpa_device *vdev, unsigned int offset,
 	struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
 
 	if (offset + len < sizeof(struct virtio_net_config))
-		memcpy(buf, &ndev->config + offset, len);
+		memcpy(buf, (u8 *)&ndev->config + offset, len);
 }
 
 static void mlx5_vdpa_set_config(struct vdpa_device *vdev, unsigned int offset, const void *buf,
--
2.27.0
