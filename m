From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Jul 2020 14:22:23 +0000
Subject: [PATCH][next] xen-netfront: remove redundant assignment to variable 'act'
Message-Id: <20200702142223.48178-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable act is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/xen-netfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 468f3f6f1425..860a0cce346d 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -856,7 +856,7 @@ static u32 xennet_run_xdp(struct netfront_queue *queue, struct page *pdata,
 {
 	struct xdp_frame *xdpf;
 	u32 len = rx->status;
-	u32 act = XDP_PASS;
+	u32 act;
 	int err;
 
 	xdp->data_hard_start = page_address(pdata);
-- 
2.27.0
