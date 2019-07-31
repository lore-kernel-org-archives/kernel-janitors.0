From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 08:01:44 +0000
Subject: [PATCH][next] RDMA/core: fix spelling mistake "Nelink" -> "Netlink"
Message-Id: <20190731080144.18327-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a warning message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/netlink.c b/drivers/infiniband/core/netlink.c
index 67a76aca2dd6..81dbd5f41bed 100644
--- a/drivers/infiniband/core/netlink.c
+++ b/drivers/infiniband/core/netlink.c
@@ -303,7 +303,7 @@ void rdma_nl_exit(void)
 
 	for (idx = 0; idx < RDMA_NL_NUM_CLIENTS; idx++)
 		WARN(rdma_nl_types[idx].cb_table,
-		     "Nelink client %d wasn't released prior to unloading %s\n",
+		     "Netlink client %d wasn't released prior to unloading %s\n",
 		     idx, KBUILD_MODNAME);
 }
 
-- 
2.20.1
