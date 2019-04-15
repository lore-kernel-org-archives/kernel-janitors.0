From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Apr 2019 09:32:31 +0000
Subject: Re: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
Message-Id: <20190415093231.GN6095@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412175504.GA20857@kadam>
In-Reply-To: <20190412175504.GA20857@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 12, 2019 at 08:25:05PM +0000, Parav Pandit wrote:
> 
> 
> > -----Original Message-----
> > From: linux-rdma-owner@vger.kernel.org <linux-rdma-
> > owner@vger.kernel.org> On Behalf Of Dan Carpenter
> > Sent: Friday, April 12, 2019 12:55 PM
> > To: Leon Romanovsky <leon@kernel.org>; Eli Cohen <eli@mellanox.com>
> > Cc: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> > linux-rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH] IB/mlx5: add checking for "vf" from do_setvfinfo()
> > 
> > My static checker complains that these "vf" variables come from the user in
> > do_setvfinfo() and haven't been checked to make sure they're valid.
> > 
> > Fixes: eff901d30e6c ("IB/mlx5: Implement callbacks for manipulating VFs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Untested static checker stuff.  Please review carefully.
> > 
> >  drivers/infiniband/hw/mlx5/ib_virt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/infiniband/hw/mlx5/ib_virt.c
> > b/drivers/infiniband/hw/mlx5/ib_virt.c
> > index 649a3364f838..9a8eebe3d462 100644
> > --- a/drivers/infiniband/hw/mlx5/ib_virt.c
> > +++ b/drivers/infiniband/hw/mlx5/ib_virt.c
> > @@ -56,6 +56,9 @@ int mlx5_ib_get_vf_config(struct ib_device *device, int
> > vf, u8 port,
> >  	struct mlx5_hca_vport_context *rep;
> >  	int err;
> > 
> > +	if (vf < 0 || vf >= pci_sriov_get_totalvfs(mdev->pdev))
> > +		return -EINVAL;
> > +
> I traced back ndo_get_vf_config and friend functions. vf number is u32 from user space.
> 
> And all the VF operations at ndo ops level and at driver level should be changed from int to u32.
> After that vf < 0 check is not needed.
> 
> >  	rep = kzalloc(sizeof(*rep), GFP_KERNEL);
> >  	if (!rep)
> >  		return -ENOMEM;
> > @@ -99,6 +102,9 @@ int mlx5_ib_set_vf_link_state(struct ib_device *device,
> > int vf,
> >  	struct mlx5_vf_context *vfs_ctx = mdev->priv.sriov.vfs_ctx;
> >  	int err;
> > 
> > +	if (vf < 0 || vf >= pci_sriov_get_totalvfs(mdev->pdev))
> > +		return -EINVAL;
> > +
> We are currently working on a patch to post in mid-May to not have access to pdev in this file.
> If the vf > desired value, HCA firmware should be failing this command too.

I'm not sure what you want me to do with this information.  :P

regards,
dan carpenter
