From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Apr 2017 18:45:16 +0000
Subject: [PATCH v2 12/17] IB/mlx4: Delete an unnecessary variable assignment in mlx4_ib_add()
Message-Id: <a03ae0dd-eaf4-2795-1612-15652ece729c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
 <1492720654.3041.16.camel@redhat.com>
 <a56f9301-e116-c59c-681a-9108519920e5@users.sourceforge.net>
In-Reply-To: <a56f9301-e116-c59c-681a-9108519920e5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Leon Romanovsky <leonro@mellanox.com>, Majd Dibbiny <majd@mellanox.com>, Matan Barak <matanb@mellanox.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, linux-rdma@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Apr 2017 18:52:03 +0200

Delete an assignment for the local variable "num_ports" at the beginning
because it was initialised with the same value.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Reviewed-by: Majd Dibbiny <majd@mellanox.com>
---
 drivers/infiniband/hw/mlx4/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/main.c b/drivers/infiniband/hw/mlx4/main.c
index d08b9b154c97..4eb2466530dc 100644
--- a/drivers/infiniband/hw/mlx4/main.c
+++ b/drivers/infiniband/hw/mlx4/main.c
@@ -2618,8 +2618,6 @@ static void *mlx4_ib_add(struct mlx4_dev *dev)
 	struct counter_index *new_counter_index;
 
 	pr_info_once("%s", mlx4_ib_version);
-
-	num_ports = 0;
 	mlx4_foreach_ib_transport_port(i, dev)
 		num_ports++;
 
-- 
2.12.2

