From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Feb 2017 18:43:30 +0000
Subject: [bug report] net: phy: Check phydev->drv
Message-Id: <20170222184330.GA16248@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

This is a semi-automatic email about new static checker warnings.

The patch 25149ef9d25c: "net: phy: Check phydev->drv" from Feb 17, 
2017, leads to the following Smatch complaint:

drivers/net/phy/phy.c:1115 phy_state_machine()
	 error: we previously assumed 'phydev->drv' could be null (see line 981)

drivers/net/phy/phy.c
   980	
   981		if (phydev->drv && phydev->drv->link_change_notify)
                    ^^^^^^^^^^^
New check for NULL.

   982			phydev->drv->link_change_notify(phydev);
   983	
   984		switch (phydev->state) {
   985		case PHY_DOWN:
   986		case PHY_STARTING:
   987		case PHY_READY:
   988		case PHY_PENDING:
   989			break;
   990		case PHY_UP:
   991			needs_aneg = true;
   992	
   993			phydev->link_timeout = PHY_AN_TIMEOUT;
   994	
   995			break;
   996		case PHY_AN:
   997			err = phy_read_status(phydev);
   998			if (err < 0)
   999				break;
  1000	
  1001			/* If the link is down, give up on negotiation for now */
  1002			if (!phydev->link) {
  1003				phydev->state = PHY_NOLINK;
  1004				netif_carrier_off(phydev->attached_dev);
  1005				phy_adjust_link(phydev);
  1006				break;
  1007			}
  1008	
  1009			/* Check if negotiation is done.  Break if there's an error */
  1010			err = phy_aneg_done(phydev);
  1011			if (err < 0)
  1012				break;
  1013	
  1014			/* If AN is done, we're running */
  1015			if (err > 0) {
  1016				phydev->state = PHY_RUNNING;
  1017				netif_carrier_on(phydev->attached_dev);
  1018				phy_adjust_link(phydev);
  1019	
  1020			} else if (0 = phydev->link_timeout--)
  1021				needs_aneg = true;
  1022			break;
  1023		case PHY_NOLINK:
  1024			if (phy_interrupt_is_valid(phydev))
  1025				break;
  1026	
  1027			err = phy_read_status(phydev);
  1028			if (err)
  1029				break;
  1030	
  1031			if (phydev->link) {
  1032				if (AUTONEG_ENABLE = phydev->autoneg) {
  1033					err = phy_aneg_done(phydev);
  1034					if (err < 0)
  1035						break;
  1036	
  1037					if (!err) {
  1038						phydev->state = PHY_AN;
  1039						phydev->link_timeout = PHY_AN_TIMEOUT;
  1040						break;
  1041					}
  1042				}
  1043				phydev->state = PHY_RUNNING;
  1044				netif_carrier_on(phydev->attached_dev);
  1045				phy_adjust_link(phydev);
  1046			}
  1047			break;
  1048		case PHY_FORCING:
  1049			err = genphy_update_link(phydev);
  1050			if (err)
  1051				break;
  1052	
  1053			if (phydev->link) {
  1054				phydev->state = PHY_RUNNING;
  1055				netif_carrier_on(phydev->attached_dev);
  1056			} else {
  1057				if (0 = phydev->link_timeout--)
  1058					needs_aneg = true;
  1059			}
  1060	
  1061			phy_adjust_link(phydev);
  1062			break;
  1063		case PHY_RUNNING:
  1064			/* Only register a CHANGE if we are polling and link changed
  1065			 * since latest checking.
  1066			 */
  1067			if (phydev->irq = PHY_POLL) {
  1068				old_link = phydev->link;
  1069				err = phy_read_status(phydev);
  1070				if (err)
  1071					break;
  1072	
  1073				if (old_link != phydev->link)
  1074					phydev->state = PHY_CHANGELINK;
  1075			}
  1076			/*
  1077			 * Failsafe: check that nobody set phydev->link=0 between two
  1078			 * poll cycles, otherwise we won't leave RUNNING state as long
  1079			 * as link remains down.
  1080			 */
  1081			if (!phydev->link && phydev->state = PHY_RUNNING) {
  1082				phydev->state = PHY_CHANGELINK;
  1083				phydev_err(phydev, "no link in PHY_RUNNING\n");
  1084			}
  1085			break;
  1086		case PHY_CHANGELINK:
  1087			err = phy_read_status(phydev);
  1088			if (err)
  1089				break;
  1090	
  1091			if (phydev->link) {
  1092				phydev->state = PHY_RUNNING;
  1093				netif_carrier_on(phydev->attached_dev);
  1094			} else {
  1095				phydev->state = PHY_NOLINK;
  1096				netif_carrier_off(phydev->attached_dev);
  1097			}
  1098	
  1099			phy_adjust_link(phydev);
  1100	
  1101			if (phy_interrupt_is_valid(phydev))
  1102				err = phy_config_interrupt(phydev,
  1103							   PHY_INTERRUPT_ENABLED);
  1104			break;
  1105		case PHY_HALTED:
  1106			if (phydev->link) {
  1107				phydev->link = 0;
  1108				netif_carrier_off(phydev->attached_dev);
  1109				phy_adjust_link(phydev);
  1110				do_suspend = true;
  1111			}
  1112			break;
  1113		case PHY_RESUMING:
  1114			if (AUTONEG_ENABLE = phydev->autoneg) {
  1115				err = phy_aneg_done(phydev);
                                      ^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference (inside function call).

  1116				if (err < 0)
  1117					break;

regards,
dan carpenter
