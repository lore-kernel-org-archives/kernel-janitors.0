From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Apr 2019 08:21:16 +0000
Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
Message-Id: <20190416082112.GA27670@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412175504.GA20857@kadam>
In-Reply-To: <20190412175504.GA20857@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 15, 2019 at 08:04:43PM +0000, Parav Pandit wrote:
> 
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, April 15, 2019 4:46 AM
> > To: Parav Pandit <parav@mellanox.com>
> > Cc: Leon Romanovsky <leon@kernel.org>; Eli Cohen <eli@mellanox.com>;
> > Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> > linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> > Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
> > 
> > On Fri, Apr 12, 2019 at 08:25:05PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: linux-rdma-owner@vger.kernel.org <linux-rdma-
> > > > owner@vger.kernel.org> On Behalf Of Dan Carpenter
> > > > Sent: Friday, April 12, 2019 12:55 PM
> > > > To: Leon Romanovsky <leon@kernel.org>; Eli Cohen <eli@mellanox.com>
> > > > Cc: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe
> > > > <jgg@ziepe.ca>; linux-rdma@vger.kernel.org;
> > > > kernel-janitors@vger.kernel.org
> > > > Subject: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
> > > >
> > > > My static checker complains that these "vf" variables come from the
> > > > user in
> > > > do_setvfinfo() and haven't been checked to make sure they're valid.
> > > >
> > > > Fixes: eff901d30e6c ("IB/mlx5: Implement callbacks for manipulating
> > > > VFs")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > Untested static checker stuff.  Please review carefully.
> > > >
> > > >  drivers/infiniband/hw/mlx5/ib_virt.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/drivers/infiniband/hw/mlx5/ib_virt.c
> > > > b/drivers/infiniband/hw/mlx5/ib_virt.c
> > > > index 649a3364f838..9a8eebe3d462 100644
> > > > --- a/drivers/infiniband/hw/mlx5/ib_virt.c
> > > > +++ b/drivers/infiniband/hw/mlx5/ib_virt.c
> > > > @@ -56,6 +56,9 @@ int mlx5_ib_get_vf_config(struct ib_device
> > > > *device, int vf, u8 port,
> > > >  	struct mlx5_hca_vport_context *rep;
> > > >  	int err;
> > > >
> > > > +	if (vf < 0 || vf >= pci_sriov_get_totalvfs(mdev->pdev))
> > > > +		return -EINVAL;
> > > > +
> > > I traced back ndo_get_vf_config and friend functions. vf number is u32
> > from user space.
> > >
> > > And all the VF operations at ndo ops level and at driver level should be
> > changed from int to u32.
> > > After that vf < 0 check is not needed.
> > >
> > 
> > I've been thinking about this and I don't think it's a good idea.  It just makes
> > backporting the fix a lot more complicated.  It might be a good idea as a
> > cleanup later though.
> > 
> Data type correction I think is common approach. I have seen int to bool changes.
> 
> Regarding this fix, I am saying if vf index is negative (as very large positive number for fw), it will get failed anyway when its > total_num_vfs.

Yeah.  But the call tree here is:

do_setvfinfo()
-> ops->ndo_get_vf_config()
   -> rtnl_fill_vfinfo()
      -> dev->netdev_ops->ndo_get_vf_config(dev, vfs_num, &ivi)
         -> ipoib_get_vf_config()
            -> ib_get_vf_config
               -> device->ops.get_vf_config(device, vf, port, info);

Changing the ->ndo_get_vf_config() pointer means you have to update 20
functions in various drivers.  It becomes quite involved.  We should
apply this simple self contained fix then worry about doing other
cleanups later.

> Do you see any error by passing large number currently which desires this patch or just the static checker?
> If it is static checker, I would prefer we fix the datatype..

I don't really understand the question, but I haven't tested this fix,
it's from static analysis.

regards,
dan carpenter
