From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Jan 2017 14:48:49 +0000
Subject: [PATCH] IB/cxgb3: header should be defining CXGB3_ABI_USER_H
Message-Id: <20170125144849.10894-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Fix typo in header guard macro, is currently CXBG3_ABI_USER_H and
should be CXGB3_ABI_USER_H (B and G are swapped).

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/uapi/rdma/cxgb3-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/rdma/cxgb3-abi.h b/include/uapi/rdma/cxgb3-abi.h
index 48a19bd..d24eee1 100644
--- a/include/uapi/rdma/cxgb3-abi.h
+++ b/include/uapi/rdma/cxgb3-abi.h
@@ -30,7 +30,7 @@
  * SOFTWARE.
  */
 #ifndef CXGB3_ABI_USER_H
-#define CXBG3_ABI_USER_H
+#define CXGB3_ABI_USER_H
 
 #include <linux/types.h>
 
-- 
2.10.2

