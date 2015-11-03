From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2015 14:24:14 +0000
Subject: re: qed: Add link support
Message-Id: <20151103142414.GA28591@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yuval Mintz,

The patch cc875c2e4f34: "qed: Add link support" from Oct 26, 2015,
leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_main.c:940 qed_set_link()
	warn: bitwise AND condition is false here

drivers/net/ethernet/qlogic/qed/qed_main.c
   925          link_params = qed_mcp_get_link_params(hwfn);
   926          if (params->override_flags & QED_LINK_OVERRIDE_SPEED_AUTONEG)
   927                  link_params->speed.autoneg = params->autoneg;
   928          if (params->override_flags & QED_LINK_OVERRIDE_SPEED_ADV_SPEEDS) {
   929                  link_params->speed.advertised_speeds = 0;
   930                  if ((params->adv_speeds & SUPPORTED_1000baseT_Half) ||
   931                      (params->adv_speeds & SUPPORTED_1000baseT_Full))
   932                          link_params->speed.advertised_speeds |   933                                  NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_1G;
   934                  if (params->adv_speeds & SUPPORTED_10000baseKR_Full)
   935                          link_params->speed.advertised_speeds |   936                                  NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_10G;
   937                  if (params->adv_speeds & SUPPORTED_40000baseLR4_Full)
   938                          link_params->speed.advertised_speeds |   939                                  NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_40G;
   940                  if (params->adv_speeds & 0)
                            ^^^^^^^^^^^^^^^^^^^^^^
False.

   941                          link_params->speed.advertised_speeds |   942                                  NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_50G;
   943                  if (params->adv_speeds & 0)
                            ^^^^^^^^^^^^^^^^^^^^^^
False.

   944                          link_params->speed.advertised_speeds |   945                                  NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_100G;
   946          }

regards,
dan carpenter
