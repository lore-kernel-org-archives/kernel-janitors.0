From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:26:38 +0000
Subject: [PATCH 32/42] drivers/net/bnx2x: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052226210.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This patch doesn't change the semantics of the code.  But it might not be
what is intended.

 drivers/net/bnx2x/bnx2x_link.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/bnx2x/bnx2x_link.c b/drivers/net/bnx2x/bnx2x_link.c
index 0383e30..0fa0991 100644
--- a/drivers/net/bnx2x/bnx2x_link.c
+++ b/drivers/net/bnx2x/bnx2x_link.c
@@ -1254,11 +1254,11 @@ static void bnx2x_set_autoneg(struct link_params *params,
 		    PORT_HW_CFG_SPEED_CAPABILITY_D0_1G)
 			reg_val |= MDIO_CL73_IEEEB1_AN_ADV2_ADVR_1000M_KX;
 
-			CL45_WR_OVER_CL22(bp, params->port,
-					      params->phy_addr,
-					      MDIO_REG_BANK_CL73_IEEEB1,
-					      MDIO_CL73_IEEEB1_AN_ADV2,
-				      reg_val);
+		CL45_WR_OVER_CL22(bp, params->port,
+				      params->phy_addr,
+				      MDIO_REG_BANK_CL73_IEEEB1,
+				      MDIO_CL73_IEEEB1_AN_ADV2,
+			      reg_val);
 
 		/* CL73 Autoneg Enabled */
 		reg_val = MDIO_CL73_IEEEB0_CL73_AN_CONTROL_AN_EN;
