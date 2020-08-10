From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 07:58:24 +0000
Subject: [PATCH] RDMA/core: fix spelling mistake "Could't" -> "Couldn't"
Message-Id: <20200810075824.46770-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index 82bfee258982..d16d42b3d2ce 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -2747,7 +2747,7 @@ static int __init ib_core_init(void)
 
 	ret = addr_init();
 	if (ret) {
-		pr_warn("Could't init IB address resolution\n");
+		pr_warn("Couldn't init IB address resolution\n");
 		goto err_ibnl;
 	}
 
-- 
2.27.0
