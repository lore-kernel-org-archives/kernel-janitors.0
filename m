From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2018 13:29:42 +0000
Subject: [bug report] net: fec: add phy_reset_after_clk_enable() support
Message-Id: <20180627132942.hrkextrqujujy4ma@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Richard Leitner,

This is a semi-automatic email about new static checker warnings.

The patch 1b0a83ac04e3: "net: fec: add phy_reset_after_clk_enable() 
support" from Dec 11, 2017, leads to the following Smatch complaint:

    drivers/net/ethernet/freescale/fec_main.c:2892 fec_enet_open()
     error: we previously assumed 'ndev->phydev' could be null (see line 2861)

drivers/net/ethernet/freescale/fec_main.c
  2860		 */
  2861		if (ndev->phydev && ndev->phydev->drv)
                    ^^^^^^^^^^^^
The patch introduces a new test for NULL.

  2862			reset_again = false;
  2863		else
  2864			reset_again = true;
  2865	
  2866		/* I should reset the ring buffers here, but I don't yet know
  2867		 * a simple way to do that.
  2868		 */
  2869	
  2870		ret = fec_enet_alloc_buffers(ndev);
  2871		if (ret)
  2872			goto err_enet_alloc;
  2873	
  2874		/* Init MAC prior to mii bus probe */
  2875		fec_restart(ndev);
  2876	
  2877		/* Probe and connect to PHY when open the interface */
  2878		ret = fec_enet_mii_probe(ndev);
  2879		if (ret)
  2880			goto err_enet_mii_probe;
  2881	
  2882		/* Call phy_reset_after_clk_enable() again if it failed during
  2883		 * phy_reset_after_clk_enable() before because the PHY wasn't probed.
  2884		 */
  2885		if (reset_again)
  2886			phy_reset_after_clk_enable(ndev->phydev);
  2887	
  2888		if (fep->quirks & FEC_QUIRK_ERR006687)
  2889			imx6q_cpuidle_fec_irqs_used();
  2890	
  2891		napi_enable(&fep->napi);
  2892		phy_start(ndev->phydev);
                          ^^^^^^^^^^^^
But the old code dereferences it unconditionally inside the function.

  2893		netif_tx_start_all_queues(ndev);
  2894	

regards,
dan carpenter
