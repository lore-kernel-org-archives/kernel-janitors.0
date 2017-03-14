From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:50:10 +0000
Subject: [bug report] net: sun: sungem: use new api ethtool_{get|set}_link_ksettings
Message-Id: <20170314075010.GA6022@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Philippe Reynes,

This is a semi-automatic email about new static checker warnings.

The patch 92552fdd557: "net: sun: sungem: use new api 
ethtool_{get|set}_link_ksettings" from Mar 5, 2017, leads to the 
following Smatch complaint:

drivers/net/ethernet/sun/sungem.c:1284 gem_begin_auto_negotiation()
	 warn: variable dereferenced before check 'ep' (see line 1263)

drivers/net/ethernet/sun/sungem.c
  1262		ethtool_convert_link_mode_to_legacy_u32(&advertising,
  1263							ep->link_modes.advertising);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
Patch adds new dereference.

  1264	
  1265		if (gp->phy_type != phy_mii_mdio0 &&
  1266	     	    gp->phy_type != phy_mii_mdio1)
  1267	     	    	goto non_mii;
  1268	
  1269		/* Setup advertise */
  1270		if (found_mii_phy(gp))
  1271			features = gp->phy_mii.def->features;
  1272		else
  1273			features = 0;
  1274	
  1275		advertise = features & ADVERTISE_MASK;
  1276		if (gp->phy_mii.advertising != 0)
  1277			advertise &= gp->phy_mii.advertising;
  1278	
  1279		autoneg = gp->want_autoneg;
  1280		speed = gp->phy_mii.speed;
  1281		duplex = gp->phy_mii.duplex;
  1282	
  1283		/* Setup link parameters */
  1284		if (!ep)
                    ^^^
Old code assumed it could be NULL.

  1285			goto start_aneg;
  1286		if (ep->base.autoneg = AUTONEG_ENABLE) {

regards,
dan carpenter
