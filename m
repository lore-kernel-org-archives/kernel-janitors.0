From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 05 Oct 2012 22:40:54 +0000
Subject: [PATCH 18/20 V2] drivers/net/ethernet/sun/sungem.c: fix error return code
Message-Id: <1349476856-16075-3-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349476856-16075-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1349476856-16075-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: jdmason@kudzu.us, gerard.lledo@gmail.com, dhowells@redhat.com, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

The function gem_init_one() return 0 for success and negative value
for most of its internal tests failures. There is one exception
that is error case going to err_out_free_consistent:. For this error
case, the function abort its success execution path, but returns non
negative value, making it difficult for a caller function to notice
the error.

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

 drivers/net/ethernet/sun/sungem.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 9ae12d0..6c8695e 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -2963,7 +2963,8 @@ static int __devinit gem_init_one(struct pci_dev *pdev,
 		goto err_out_iounmap;
 	}
 
-	if (gem_get_device_address(gp))
+	err = gem_get_device_address(gp);
+	if (err)
 		goto err_out_free_consistent;
 
 	dev->netdev_ops = &gem_netdev_ops;

