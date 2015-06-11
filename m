From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 12:20:28 +0000
Subject: Re: [patch] drm/amdgpu: potential NULL dereference on error
Message-Id: <20150611122028.GK11734@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611084933.GA27393@mwanda>
 <55797906.2090501@bfs.de>
In-Reply-To: <55797906.2090501@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, yanyang1 <young.yang@amd.com>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, Jun 11, 2015 at 02:03:18PM +0200, walter harms wrote:
> 
> 
> Am 11.06.2015 10:49, schrieb Dan Carpenter:
> > debugfs_create_file() can return an error pointer if debugfs is disabled
> > or it can return NULL on error.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 36be03c..adba2a1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -1980,6 +1980,8 @@ static int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
> >  				  adev, &amdgpu_debugfs_regs_fops);
> >  	if (IS_ERR(ent))
> >  		return PTR_ERR(ent);
> > +	if (!ent)
> > +		return -ENOMEM;
> >  	i_size_write(ent->d_inode, adev->rmmio_size);
> >  	adev->debugfs_regs = ent;
> 
> 
> 
> would  PTR_ERR_OR_ZERO() by an option ?
> 
> on the other hand,
> why does debugfs_create_file() does not return -ENOMEN instead of NULL ?
> 

Actually if debugfs is disabled then we should probably carry on.  Let
me change it to:

	if (IS_ERR(ent))
		return 0;

	if (!ent)
		return -ENOMEM;

regards,
dan carpenter

