From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Apr 2017 18:55:52 +0000
Subject: [bug report] net: dsa: Mock-up driver
Message-Id: <20170403185552.GA10603@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 98cd1552ea27: "net: dsa: Mock-up driver" from Mar 30, 2017,
leads to the following static checker warning:

	drivers/net/dsa/dsa_loop.c:181 dsa_loop_port_vlan_del()
	error: XXX uninitialized symbol 'pvid'.

drivers/net/dsa/dsa_loop.c
   163          bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
   164          struct dsa_loop_priv *ps = ds->priv;
   165          struct mii_bus *bus = ps->bus;
   166          struct dsa_loop_vlan *vl;
   167          u16 vid, pvid;
   168  
   169          dev_dbg(ds->dev, "%s\n", __func__);
   170  
   171          /* Just do a sleeping operation to make lockdep checks effective */
   172          mdiobus_read(bus, ps->port_base + port, MII_BMSR);
   173  
   174          for (vid = vlan->vid_begin; vid <= vlan->vid_end; ++vid) {
   175                  vl = &ps->vlans[vid];
   176  
   177                  vl->members &= ~BIT(port);
   178                  if (untagged)
   179                          vl->untagged &= ~BIT(port);
   180  
   181                  if (pvid = vid)

What's pvid supposed to start out as?  This isn't right.

   182                          pvid = 1;
   183          }
   184          ps->pvid = pvid;
   185  
   186          return 0;

regards,
dan carpenter
