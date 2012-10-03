From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 03 Oct 2012 16:18:10 +0000
Subject: [PATCH 19/20] drivers/net/ethernet/marvell/skge.c: fix error return code
Message-Id: <1349281090-10013-20-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlindner@marvell.com
Cc: kernel-janitors@vger.kernel.org, shemminger@vyatta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/net/ethernet/marvell/skge.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index 5a30bf8..91836b5 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -3945,8 +3945,10 @@ static int __devinit skge_probe(struct pci_dev *pdev,
 		skge_board_name(hw), hw->chip_rev);
 
 	dev = skge_devinit(hw, 0, using_dac);
-	if (!dev)
+	if (!dev) {
+		err = -ENOMEM;
 		goto err_out_led_off;
+	}
 
 	/* Some motherboards are broken and has zero in ROM. */
 	if (!is_valid_ether_addr(dev->dev_addr))

