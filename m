From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Apr 2017 18:59:32 +0000
Subject: [bug report] net: dsa: Mock-up driver
Message-Id: <20170403185932.GA24017@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403185552.GA10603@mwanda>
In-Reply-To: <20170403185552.GA10603@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 98cd1552ea27: "net: dsa: Mock-up driver" from Mar 30, 2017,
leads to the following static checker warning:

	drivers/net/dsa/dsa_loop.c:223 dsa_loop_port_vlan_dump()
	error: uninitialized symbol 'err'.

drivers/net/dsa/dsa_loop.c
   189  static int dsa_loop_port_vlan_dump(struct dsa_switch *ds, int port,
   190                                     struct switchdev_obj_port_vlan *vlan,
   191                                     int (*cb)(struct switchdev_obj *obj))
   192  {
   193          struct dsa_loop_priv *ps = ds->priv;
   194          struct mii_bus *bus = ps->bus;
   195          struct dsa_loop_vlan *vl;
   196          u16 vid, vid_start = 0;
   197          int err;
   198  
   199          dev_dbg(ds->dev, "%s\n", __func__);
   200  
   201          /* Just do a sleeping operation to make lockdep checks effective */
   202          mdiobus_read(bus, ps->port_base + port, MII_BMSR);
   203  
   204          for (vid = vid_start; vid < DSA_LOOP_VLANS; vid++) {
   205                  vl = &ps->vlans[vid];
   206  
   207                  if (!(vl->members & BIT(port)))
   208                          continue;

This one probably is not as serious a concern but the static checker is
whining that we could hit this continue on every iteration through the
loop.

   209  
   210                  vlan->vid_begin = vlan->vid_end = vid;
   211                  vlan->flags = 0;
   212  
   213                  if (vl->untagged & BIT(port))
   214                          vlan->flags |= BRIDGE_VLAN_INFO_UNTAGGED;
   215                  if (ps->pvid = vid)
   216                          vlan->flags |= BRIDGE_VLAN_INFO_PVID;
   217  
   218                  err = cb(&vlan->obj);
   219                  if (err)
   220                          break;
   221          }
   222  
   223          return err;

And then return an uninitialized value.

   224  }

regards,
dan carpenter
