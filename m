From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Oct 2017 16:19:21 +0000
Subject: [PATCH] net/ncsi: Delete an error message for a failed memory allocation in ncsi_rsp_handler_gc()
Message-Id: <dbcf6a74-ce63-8a01-615b-162ebe329c6c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Gavin Shan <gwshan@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Oct 2017 18:03:11 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/ncsi/ncsi-rsp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 265b9a892d41..eb3611ffbb62 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -686,11 +686,8 @@ static int ncsi_rsp_handler_gc(struct ncsi_request *nr)
 
 		size = sizeof(*ncf) + cnt * entry_size;
 		ncf = kzalloc(size, GFP_ATOMIC);
-		if (!ncf) {
-			pr_warn("%s: Cannot alloc filter table (%d)\n",
-				__func__, i);
+		if (!ncf)
 			return -ENOMEM;
-		}
 
 		ncf->index = i;
 		ncf->total = cnt;
-- 
2.14.2

