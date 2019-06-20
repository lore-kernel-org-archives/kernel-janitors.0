From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Jun 2019 13:50:52 +0000
Subject: [PATCH][next] RDMA: check for null return from call to ib_get_client_data
Message-Id: <20190620135052.27367-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Parav Pandit <parav@mellanox.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return from ib_get_client_data can potentially be null, so add a null
check on umad_dev and return -ENODEV in this unlikely case to avoid any
null pointer deferences.

Addresses-Coverity: ("Dereference null return")
Fixes: 8f71bb0030b8 ("RDMA: Report available cdevs through RDMA_NLDEV_CMD_GET_CHARDEV")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/user_mad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/core/user_mad.c b/drivers/infiniband/core/user_mad.c
index 547090b41cfb..d78a35913824 100644
--- a/drivers/infiniband/core/user_mad.c
+++ b/drivers/infiniband/core/user_mad.c
@@ -1153,6 +1153,9 @@ static int ib_issm_get_nl_info(struct ib_device *ibdev, void *client_data,
 	struct ib_umad_device *umad_dev  		ib_get_client_data(ibdev, &umad_client);
 
+	if (!umad_dev)
+		return -ENODEV;
+
 	if (!rdma_is_port_valid(ibdev, res->port))
 		return -EINVAL;
 
-- 
2.20.1
