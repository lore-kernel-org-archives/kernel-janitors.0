From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 03 Oct 2012 16:18:05 +0000
Subject: [PATCH 16/20] drivers/net/ethernet/renesas/sh_eth.c: fix error return code
Message-Id: <1349281090-10013-15-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: kernel-janitors@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, nobuhiro.iwamatsu.yj@renesas.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

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
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index bad8f2e..c8bfea0 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2438,6 +2438,7 @@ static int sh_eth_drv_probe(struct platform_device *pdev)
 		rtsu = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		if (!rtsu) {
 			dev_err(&pdev->dev, "Not found TSU resource\n");
+			ret = -ENODEV;
 			goto out_release;
 		}
 		mdp->tsu_addr = ioremap(rtsu->start,

