From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Jun 2017 11:03:40 +0000
Subject: [bug report] rocker: Change world_ops API and implementation to be switchdev independant
Message-Id: <20170627110339.hdfj2wcic7p2th4d@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Arkadi Sharshevsky,

The patch 00fc0c51e35b: "rocker: Change world_ops API and
implementation to be switchdev independant" from Jun 8, 2017, leads
to the following Sparse warnings:

drivers/net/ethernet/rocker/rocker_ofdpa.c:1180:56: warning: incorrect type in argument 3 (different base types)
drivers/net/ethernet/rocker/rocker_ofdpa.c:1180:56:    expected restricted gfp_t [usertype] flags
drivers/net/ethernet/rocker/rocker_ofdpa.c:1180:56:    got unsigned long
drivers/net/ethernet/rocker/rocker_ofdpa.c:1459:48: warning: incorrect type in argument 3 (different base types)
drivers/net/ethernet/rocker/rocker_ofdpa.c:1459:48:    expected restricted gfp_t [usertype] flags
drivers/net/ethernet/rocker/rocker_ofdpa.c:1459:48:    got unsigned long

drivers/net/ethernet/rocker/rocker_ofdpa.c
  1167  static int ofdpa_group_l2_fan_out(struct ofdpa_port *ofdpa_port,
  1168                                    int flags, u8 group_count,
  1169                                    const u32 *group_ids, u32 group_id)
  1170  {
  1171          struct ofdpa_group_tbl_entry *entry;
  1172  
  1173          entry = kzalloc(sizeof(*entry), GFP_KERNEL);
                                                ^^^^^^^^^^
We're sleeping here.  Should this be testing flags and using GFP_ATOMIC?

  1174          if (!entry)
  1175                  return -ENOMEM;
  1176  
  1177          entry->group_id = group_id;
  1178          entry->group_count = group_count;
  1179  
  1180          entry->group_ids = kcalloc(flags, group_count, sizeof(u32));
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These are in the wrong order so it won't allocate the right amount of
memory ever.  Also these are not gfp_t flags, they're a custom flag for
this driver.  The one thing that they have in common is a "no sleep"
option, so we might want to test for that and ensure that kmalloc()
doesn't sleep.  I don't know...

  1181          if (!entry->group_ids) {
  1182                  kfree(entry);
  1183                  return -ENOMEM;
  1184          }
  1185          memcpy(entry->group_ids, group_ids, group_count * sizeof(u32));
  1186  
  1187          return ofdpa_group_tbl_do(ofdpa_port, flags, entry);
  1188  }


[ snip ]

  1447  static int ofdpa_port_vlan_flood_group(struct ofdpa_port *ofdpa_port,
  1448                                         int flags, __be16 vlan_id)
  1449  {
  1450          struct ofdpa_port *p;
  1451          const struct ofdpa *ofdpa = ofdpa_port->ofdpa;
  1452          unsigned int port_count = ofdpa->rocker->port_count;
  1453          u32 group_id = ROCKER_GROUP_L2_FLOOD(vlan_id, 0);
  1454          u32 *group_ids;
  1455          u8 group_count = 0;
  1456          int err = 0;
  1457          int i;
  1458  
  1459          group_ids = kcalloc(flags, port_count, sizeof(u32));
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same.

  1460          if (!group_ids)
  1461                  return -ENOMEM;
  1462  


regards,
dan carpenter
