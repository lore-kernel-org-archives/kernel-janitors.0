From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Apr 2019 17:55:04 +0000
Subject: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
Message-Id: <20190412175504.GA20857@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

My static checker complains that these "vf" variables come from the
user in do_setvfinfo() and haven't been checked to make sure they're
valid.

Fixes: eff901d30e6c ("IB/mlx5: Implement callbacks for manipulating VFs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested static checker stuff.  Please review carefully.

 drivers/infiniband/hw/mlx5/ib_virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/infiniband/hw/mlx5/ib_virt.c b/drivers/infiniband/hw/mlx5/ib_virt.c
index 649a3364f838..9a8eebe3d462 100644
--- a/drivers/infiniband/hw/mlx5/ib_virt.c
+++ b/drivers/infiniband/hw/mlx5/ib_virt.c
@@ -56,6 +56,9 @@ int mlx5_ib_get_vf_config(struct ib_device *device, int vf, u8 port,
 	struct mlx5_hca_vport_context *rep;
 	int err;
 
+	if (vf < 0 || vf >= pci_sriov_get_totalvfs(mdev->pdev))
+		return -EINVAL;
+
 	rep = kzalloc(sizeof(*rep), GFP_KERNEL);
 	if (!rep)
 		return -ENOMEM;
@@ -99,6 +102,9 @@ int mlx5_ib_set_vf_link_state(struct ib_device *device, int vf,
 	struct mlx5_vf_context *vfs_ctx = mdev->priv.sriov.vfs_ctx;
 	int err;
 
+	if (vf < 0 || vf >= pci_sriov_get_totalvfs(mdev->pdev))
+		return -EINVAL;
+
 	in = kzalloc(sizeof(*in), GFP_KERNEL);
 	if (!in)
 		return -ENOMEM;
-- 
2.17.1
