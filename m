From: David Miller <davem@davemloft.net>
Date: Thu, 21 Nov 2019 22:44:29 +0000
Subject: Re: [PATCH net] net: rtnetlink: prevent underflows in do_setvfinfo()
Message-Id: <20191121.144429.649625073638417068.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120123438.vxn2ngnxzpcaqot4@kili.mountain>
In-Reply-To: <20191120123438.vxn2ngnxzpcaqot4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, dsahern@gmail.com, idosch@mellanox.com, petrm@mellanox.com, jakub.kicinski@netronome.com, nikolay@cumulusnetworks.com, parav@mellanox.com, roopa@cumulusnetworks.com, johannes.berg@intel.com, mkubecek@suse.cz, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Nov 2019 15:34:38 +0300

> The "ivm->vf" variable is a u32, but the problem is that a number of
> drivers cast it to an int and then forget to check for negatives.  An
> example of this is in the cxgb4 driver.
> 
> drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
>   2890  static int cxgb4_mgmt_get_vf_config(struct net_device *dev,
>   2891                                      int vf, struct ifla_vf_info *ivi)
>                                             ^^^^^^
>   2892  {
>   2893          struct port_info *pi = netdev_priv(dev);
>   2894          struct adapter *adap = pi->adapter;
>   2895          struct vf_info *vfinfo;
>   2896  
>   2897          if (vf >= adap->num_vfs)
>                     ^^^^^^^^^^^^^^^^^^^
>   2898                  return -EINVAL;
>   2899          vfinfo = &adap->vfinfo[vf];
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> There are 48 functions affected.
 ...
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'm going to apply this and queue it up for -stable.

The u32 conversion should happen in next.
