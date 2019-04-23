From: Parav Pandit <parav@mellanox.com>
Date: Tue, 23 Apr 2019 22:32:11 +0000
Subject: RE: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
Message-Id: <AM4PR0501MB2260ADC1DA37E87D01979969D1230@AM4PR0501MB2260.eurprd05.prod.outlook.com>
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
> Sent: Tuesday, April 23, 2019 10:50 AM
> To: Parav Pandit <parav@mellanox.com>
> Cc: Leon Romanovsky <leon@kernel.org>; Eli Cohen <eli@mellanox.com>;
> Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
> 
> On Mon, Apr 22, 2019 at 03:09:00PM +0000, Parav Pandit wrote:
> > Hi Dan,
> >
> > > -----Original Message-----
> > > From: Dan Carpenter <dan.carpenter@oracle.com>
> > > Sent: Monday, April 22, 2019 3:09 AM
> > > To: Parav Pandit <parav@mellanox.com>
> > > Cc: Leon Romanovsky <leon@kernel.org>; Eli Cohen
> <eli@mellanox.com>;
> > > Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> > > linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> > > Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from
> > > do_setvfinfo()
> > >
> > > On Tue, Apr 16, 2019 at 10:54:42PM +0000, Parav Pandit wrote:
> > > > > Yeah.  But the call tree here is:
> > > > >
> > > > > do_setvfinfo()
> > > > > -> ops->ndo_get_vf_config()
> > > > >    -> rtnl_fill_vfinfo()
> > > > >       -> dev->netdev_ops->ndo_get_vf_config(dev, vfs_num, &ivi)
> > > > >          -> ipoib_get_vf_config()
> > > > >             -> ib_get_vf_config
> > > > >                -> device->ops.get_vf_config(device, vf, port,
> > > > > info);
> > > > >
> > > > > Changing the ->ndo_get_vf_config() pointer means you have to
> > > > > update
> > > > > 20 functions in various drivers.  It becomes quite involved.  We
> > > > > should apply this simple self contained fix then worry about
> > > > > doing other
> > > cleanups later.
> > > > >
> > > > But if a static checker is run on following functions, they need
> > > > for vf < 0
> > > check.
> > > >
> > > > i40e_ndo_get_vf_config
> > > > mlx5e_get_vf_config
> > > > bnxt_get_vf_config
> > > > etc and few more.
> > >
> > > I checked again to see if it was "20 functions" or if it was "etc
> > > and few more"...  It turns out its only 18 functions because I
> > > double counted two functions at first.  Here is the list:
> > >
> > > be_get_vf_config
> > > bnx2x_get_vf_config
> > > bnxt_get_vf_config
> > > cxgb4_mgmt_get_vf_config
> > > efx_sriov_get_vf_config
> > > fm10k_ndo_get_vf_config
> > > i40e_ndo_get_vf_config
> > > ice_get_vf_cfg
> > > igb_ndo_get_vf_config
> > > ipoib_get_vf_config
> > > ixgbe_ndo_get_vf_config
> > > liquidio_get_vf_config
> > > mlx4_en_get_vf_config
> > > mlx5e_get_vf_config
> > > nfp_app_get_vf_config
> > > nsim_get_vf_config
> > > qede_get_vf_config
> > > qlcnic_sriov_get_vf_config
> > >
> > > But you also have to update the call tress as well...  It's really
> > > very involved.  I seriously did look at how to do this and the
> > > original patch is the Right Thing To Do [tm].  I've probably sent
> > > around 92 underflow patches and sometimes I would definitely agree
> > > with you that changing the type is the right fix but not in this case.
> > >
> > Do you plan to fix all the above functions for < 0?
> > There are other several other ndo_get_vf_* functions who need < 0 check.
> What about them?
> > Will you fix them as well?
> 
> Oh wow...  I'm looking at these now and there are a lot of bugs.  You are
> right.  To be honest, though, I'm tempted to just add a check for negatives in
> the core...  I know you don't like that...
> 
> My static analysis was supposed to catch these underflows.  It's the end of
> the day for me, but I will get this working tomorrow.
> 
We just make num_vfs to u32 in core and in drivers.
This will eliminate < 0 check. From user space value coming is u32 via netlink.
This makes things clear, forward looking.

> > Instead of doing all those fixes, why not use right u32 data type to
> eliminate < 0 check?
> >
> > What about sriov getting disabled right after > vf check passes?
> 
> I don't know the subsystem well enough to answer this question.  What do
> you suggest?
> 
I don't think > num_vfs check is needed. Device is expected to fail commands for VFs which are not valid.
