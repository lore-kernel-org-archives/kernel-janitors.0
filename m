From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Mar 2018 12:44:33 +0000
Subject: [bug report] net: fec: add phy_reset_after_clk_enable() support
Message-Id: <20180313124415.GA16682@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Richard Leitner,

This is a semi-automatic email about new static checker warnings.

The patch 1b0a83ac04e3: "net: fec: add phy_reset_after_clk_enable() 
support" from Dec 11, 2017, leads to the following Smatch complaint:

    drivers/net/ethernet/freescale/fec_main.c:2895 fec_enet_open()
    error: we previously assumed 'ndev->phydev' could be null (see line 2864)

drivers/net/ethernet/freescale/fec_main.c
  2863		 */
  2864		if (ndev->phydev && ndev->phydev->drv)
                    ^^^^^^^^^^^^
Patch introduced a new check.

  2865			reset_again = false;
  2866		else
  2867			reset_again = true;
  2868	
  2869		/* I should reset the ring buffers here, but I don't yet know
  2870		 * a simple way to do that.
  2871		 */
  2872	
  2873		ret = fec_enet_alloc_buffers(ndev);
  2874		if (ret)
  2875			goto err_enet_alloc;
  2876	
  2877		/* Init MAC prior to mii bus probe */
  2878		fec_restart(ndev);
  2879	
  2880		/* Probe and connect to PHY when open the interface */
  2881		ret = fec_enet_mii_probe(ndev);
  2882		if (ret)
  2883			goto err_enet_mii_probe;
  2884	
  2885		/* Call phy_reset_after_clk_enable() again if it failed during
  2886		 * phy_reset_after_clk_enable() before because the PHY wasn't probed.
  2887		 */
  2888		if (reset_again)
  2889			phy_reset_after_clk_enable(ndev->phydev);
  2890	
  2891		if (fep->quirks & FEC_QUIRK_ERR006687)
  2892			imx6q_cpuidle_fec_irqs_used();
  2893	
  2894		napi_enable(&fep->napi);
  2895		phy_start(ndev->phydev);
                          ^^^^^^^^^^^^
Unchecked dereference inside function.

  2896		netif_tx_start_all_queues(ndev);
  2897	

regards,
dan carpenter
