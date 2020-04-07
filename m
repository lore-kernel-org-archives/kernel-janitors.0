From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 13:51:53 +0000
Subject: [bug report] net: dsa: sja1105: Add support for the SGMII port
Message-Id: <20200407135153.GA109191@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch ffe10e679cec: "net: dsa: sja1105: Add support for the SGMII
port" from Mar 20, 2020, leads to the following static checker
warning:

	drivers/net/dsa/sja1105/sja1105_main.c:1693 sja1105_static_config_reload()
	warn: bitwise AND condition is false here

drivers/net/dsa/sja1105/sja1105_main.c
  1680  
  1681          if (sja1105_supports_sgmii(priv, SJA1105_SGMII_PORT)) {
  1682                  bool an_enabled = !!(bmcr & BMCR_ANENABLE);
  1683  
  1684                  sja1105_sgmii_pcs_config(priv, an_enabled, false);
  1685  
  1686                  if (!an_enabled) {
  1687                          int speed = SPEED_UNKNOWN;
  1688  
  1689                          if (bmcr & BMCR_SPEED1000)
  1690                                  speed = SPEED_1000;
  1691                          else if (bmcr & BMCR_SPEED100)
  1692                                  speed = SPEED_100;
  1693                          else if (bmcr & BMCR_SPEED10)
                                                ^^^^^^^^^^^^
This is zero so the condition can never be true.

  1694                                  speed = SPEED_10;
  1695  
  1696                          sja1105_sgmii_pcs_force_speed(priv, speed);
  1697                  }
  1698          }
  1699  out:
  1700          mutex_unlock(&priv->mgmt_lock);
  1701  
  1702          return rc;

regards,
dan carpenter
