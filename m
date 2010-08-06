From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 07:07:50 +0000
Subject: Re: [PATCH 32/42] drivers/net/bnx2x: Adjust confusing if
Message-Id: <20100806070749.GP9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052226210.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052226210.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Eilon Greenstein <eilong@broadcom.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 05, 2010 at 10:26:38PM +0200, Julia Lawall wrote:
> ---
> This patch doesn't change the semantics of the code.  But it might not be
> what is intended.
> 

I think there may have been some if statements which were removed before
the code was merged into the kernel?  Here is another one from that same
function.  Someone can roll this in with your patch.

regards,
dan carpenter

diff --git a/drivers/net/bnx2x/bnx2x_link.c b/drivers/net/bnx2x/bnx2x_link.c
index 0fa0991..ca0e435 100644
--- a/drivers/net/bnx2x/bnx2x_link.c
+++ b/drivers/net/bnx2x/bnx2x_link.c
@@ -1242,11 +1242,11 @@ static void bnx2x_set_autoneg(struct link_params *params,
 			MDIO_CL73_USERB0_CL73_BAM_CTRL1_BAM_NP_AFTER_BP_EN);
 
 		/* Advertise CL73 link speeds */
-			CL45_RD_OVER_CL22(bp, params->port,
-					      params->phy_addr,
-					      MDIO_REG_BANK_CL73_IEEEB1,
-					      MDIO_CL73_IEEEB1_AN_ADV2,
-					      &reg_val);
+		CL45_RD_OVER_CL22(bp, params->port,
+				      params->phy_addr,
+				      MDIO_REG_BANK_CL73_IEEEB1,
+				      MDIO_CL73_IEEEB1_AN_ADV2,
+				      &reg_val);
 		if (params->speed_cap_mask &
 		    PORT_HW_CFG_SPEED_CAPABILITY_D0_10G)
 			reg_val |= MDIO_CL73_IEEEB1_AN_ADV2_ADVR_10G_KX4;
