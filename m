From: Parav Pandit <parav@mellanox.com>
Date: Mon, 22 Apr 2019 15:09:00 +0000
Subject: RE: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
Message-Id: <VI1PR0501MB22713B232B3CF42B849F959BD1220@VI1PR0501MB2271.eurprd05.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412175504.GA20857@kadam>
In-Reply-To: <20190412175504.GA20857@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, April 22, 2019 3:09 AM
> To: Parav Pandit <parav@mellanox.com>
> Cc: Leon Romanovsky <leon@kernel.org>; Eli Cohen <eli@mellanox.com>;
> Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
> 
> On Tue, Apr 16, 2019 at 10:54:42PM +0000, Parav Pandit wrote:
> > > Yeah.  But the call tree here is:
> > >
> > > do_setvfinfo()
> > > -> ops->ndo_get_vf_config()
> > >    -> rtnl_fill_vfinfo()
> > >       -> dev->netdev_ops->ndo_get_vf_config(dev, vfs_num, &ivi)
> > >          -> ipoib_get_vf_config()
> > >             -> ib_get_vf_config
> > >                -> device->ops.get_vf_config(device, vf, port, info);
> > >
> > > Changing the ->ndo_get_vf_config() pointer means you have to update
> > > 20 functions in various drivers.  It becomes quite involved.  We
> > > should apply this simple self contained fix then worry about doing other
> cleanups later.
> > >
> > But if a static checker is run on following functions, they need for vf < 0
> check.
> >
> > i40e_ndo_get_vf_config
> > mlx5e_get_vf_config
> > bnxt_get_vf_config
> > etc and few more.
> 
> I checked again to see if it was "20 functions" or if it was "etc and few
> more"...  It turns out its only 18 functions because I double counted two
> functions at first.  Here is the list:
> 
> be_get_vf_config
> bnx2x_get_vf_config
> bnxt_get_vf_config
> cxgb4_mgmt_get_vf_config
> efx_sriov_get_vf_config
> fm10k_ndo_get_vf_config
> i40e_ndo_get_vf_config
> ice_get_vf_cfg
> igb_ndo_get_vf_config
> ipoib_get_vf_config
> ixgbe_ndo_get_vf_config
> liquidio_get_vf_config
> mlx4_en_get_vf_config
> mlx5e_get_vf_config
> nfp_app_get_vf_config
> nsim_get_vf_config
> qede_get_vf_config
> qlcnic_sriov_get_vf_config
> 
> But you also have to update the call tress as well...  It's really very involved.  I
> seriously did look at how to do this and the original patch is the Right Thing
> To Do [tm].  I've probably sent around 92 underflow patches and sometimes
> I would definitely agree with you that changing the type is the right fix but
> not in this case.
> 
Do you plan to fix all the above functions for < 0?
There are other several other ndo_get_vf_* functions who need < 0 check. What about them?
Will you fix them as well?
Instead of doing all those fixes, why not use right u32 data type to eliminate < 0 check?

What about sriov getting disabled right after > vf check passes?
