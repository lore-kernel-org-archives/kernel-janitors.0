From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 14:14:59 +0000
Subject: [PATCH] RDMA/usnic: fix spelling mistake "transistion" -> "transition"
Message-Id: <20200805141459.23069-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Benvenuti <benve@cisco.com>, Nelson Escobar <neescoba@cisco.com>, Parvi Kaustubhi <pkaustub@cisco.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a usnic_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/usnic/usnic_ib_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_main.c b/drivers/infiniband/hw/usnic/usnic_ib_main.c
index c9abe1c01e4e..662e7fc7f628 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_main.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_main.c
@@ -120,7 +120,7 @@ static void usnic_ib_qp_grp_modify_active_to_err(struct usnic_ib_dev *us_ibdev)
 								IB_QPS_ERR,
 								NULL);
 				if (status) {
-					usnic_err("Failed to transistion qp grp %u from %s to %s\n",
+					usnic_err("Failed to transition qp grp %u from %s to %s\n",
 						qp_grp->grp_id,
 						usnic_ib_qp_grp_state_to_string
 						(cur_state),
-- 
2.27.0
