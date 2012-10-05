From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 05 Oct 2012 22:10:53 +0000
Subject: [PATCH 15/20 V2] drivers/net/ethernet/natsemi/xtsonic.c: fix error return code
Message-Id: <1349475053-11464-5-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349475053-11464-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349475053-11464-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: mcuos.com@gmail.com, axel.lin@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

The function sonic_probe1() return 0 for success and negative value
for most of its internal tests failures. There is one exception
that is error case going to out:. For this error case, the
function abort its success execution path, but returns non negative
value, making it difficult for a caller function to notice the error.

This patch fixes the error case that do not return negative value.

This was found by Coccinelle, but the code change was made by hand.
This patch is not robot generated.

A simplified version of the semantic match that finds this problem is
as follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
Change from V1:
        Updated commit message. See:
        http://www.kernelhub.org/?p=2&msg9319

 drivers/net/ethernet/natsemi/xtsonic.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/natsemi/xtsonic.c b/drivers/net/ethernet/natsemi/xtsonic.c
index e01c0a0..7dfe883 100644
--- a/drivers/net/ethernet/natsemi/xtsonic.c
+++ b/drivers/net/ethernet/natsemi/xtsonic.c
@@ -205,6 +205,7 @@ static int __init sonic_probe1(struct net_device *dev)
 	if (lp->descriptors = NULL) {
 		printk(KERN_ERR "%s: couldn't alloc DMA memory for "
 				" descriptors.\n", dev_name(lp->device));
+		err = -ENOMEM;
 		goto out;
 	}
 

