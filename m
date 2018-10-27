From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 27 Oct 2018 06:12:06 +0000
Subject: [PATCH] xfrm: Fix error return code in xfrm_output_one()
Message-Id: <1540620726-100678-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

xfrm_output_one() does not return a error code when there is
no dst_entry attached to the skb, it is still possible crash
with a NULL pointer dereference in xfrm_output_resume(). Fix
it by return error code -EHOSTUNREACH.

Fixes: 9e1437937807 ("xfrm: Fix NULL pointer dereference when skb_dst_force clears the dst_entry.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/xfrm/xfrm_output.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index 4ae87c5c..fef6b2d 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -102,6 +102,7 @@ static int xfrm_output_one(struct sk_buff *skb, int err)
 		skb_dst_force(skb);
 		if (!skb_dst(skb)) {
 			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			err = -EHOSTUNREACH;
 			goto error_nolock;
 		}
