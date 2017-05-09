From: Colin King <colin.king@canonical.com>
Date: Tue, 09 May 2017 16:19:42 +0000
Subject: [PATCH] netxen_nic: set rcode to the return status from the call to netxen_issue_cmd
Message-Id: <20170509161942.32383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Chopra <manish.chopra@cavium.com>, Rahul Verma <rahul.verma@cavium.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently rcode is being initialized to NX_RCODE_SUCCESS and later it
is checked to see if it is not NX_RCODE_SUCCESS which is never true. It
appears that there is an unintentional missing assignment of rcode from
the return of the call to netxen_issue_cmd() that was dropped in
an earlier fix, so add it in.

Detected by CoverityScan, CID#401900 ("Logically dead code")

Fixes: 2dcd5d95ad6b2 ("netxen_nic: fix cdrp race condition")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
index b8d5270359cd..e30676515529 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
@@ -247,7 +247,7 @@ nx_fw_cmd_set_mtu(struct netxen_adapter *adapter, int mtu)
 	cmd.req.arg3 = 0;
 
 	if (recv_ctx->state = NX_HOST_CTX_STATE_ACTIVE)
-		netxen_issue_cmd(adapter, &cmd);
+		rcode = netxen_issue_cmd(adapter, &cmd);
 
 	if (rcode != NX_RCODE_SUCCESS)
 		return -EIO;
-- 
2.11.0

