From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Sep 2020 09:28:08 +0000
Subject: [bug report] net: vlan: Avoid using BUG() in vlan_proto_idx()
Message-Id: <20200929092808.GA485919@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch d0186842ec5f: "net: vlan: Avoid using BUG() in
vlan_proto_idx()" from Sep 24, 2020, leads to the following static
checker warning:

	net/8021q/vlan.c:60 vlan_group_prealloc_vid()
	warn: unsigned 'pidx' is never less than zero.

net/8021q/vlan.c
    50  static int vlan_group_prealloc_vid(struct vlan_group *vg,
    51                                     __be16 vlan_proto, u16 vlan_id)
    52  {
    53          struct net_device **array;
    54          unsigned int pidx, vidx;
                ^^^^^^^^^^^^^^^^^^^^^^^^

    55          unsigned int size;
    56  
    57          ASSERT_RTNL();
    58  
    59          pidx  = vlan_proto_idx(vlan_proto);
    60          if (pidx < 0)
                    ^^^^^^^^
This is unsigned.

    61                  return -EINVAL;
    62  
    63          vidx  = vlan_id / VLAN_GROUP_ARRAY_PART_LEN;
    64          array = vg->vlan_devices_arrays[pidx][vidx];
    65          if (array != NULL)
    66                  return 0;

regards,
dan carpenter
