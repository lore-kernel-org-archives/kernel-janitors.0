From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Apr 2017 18:36:05 +0000
Subject: [PATCH v2 06/17] IB/mlx4: Delete an unnecessary check before kfree() in free_pv_object()
Message-Id: <950a4a7f-01f6-9791-5d4c-41abe07366ed@users.sourceforge.net>
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
Date: Fri, 21 Apr 2017 13:50:38 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: kfree(NULL) is safe and this check is probably not required

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx4/mad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
index cf33efce69d2..3caf468ca133 100644
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@ -1962,10 +1962,8 @@ static int alloc_pv_object(struct mlx4_ib_dev *dev, int slave, int port,
 
 static void free_pv_object(struct mlx4_ib_dev *dev, int slave, int port)
 {
-	if (dev->sriov.demux[port - 1].tun[slave]) {
-		kfree(dev->sriov.demux[port - 1].tun[slave]);
-		dev->sriov.demux[port - 1].tun[slave] = NULL;
-	}
+	kfree(dev->sriov.demux[port - 1].tun[slave]);
+	dev->sriov.demux[port - 1].tun[slave] = NULL;
 }
 
 static int create_pv_resources(struct ib_device *ibdev, int slave, int port,
-- 
2.12.2

