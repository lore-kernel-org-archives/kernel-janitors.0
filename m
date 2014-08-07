From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 07 Aug 2014 15:31:15 +0000
Subject: Re: [patch] drm/radeon: add a check for allocation failure
Message-Id: <CADnq5_Mxw=ZY-7cxj440Df6PG4bFDNBvX=v70i4CR5O-277bJw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140807152736.GA10299@mwanda>
In-Reply-To: <20140807152736.GA10299@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Thu, Aug 7, 2014 at 11:27 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We can easily return -ENOMEM here if kzalloc() fails.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> index ccae4d9..d15d987 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -483,6 +483,8 @@ int radeon_vm_bo_set_addr(struct radeon_device *rdev,
>                         /* add a clone of the bo_va to clear the old address */
>                         struct radeon_bo_va *tmp;
>                         tmp = kzalloc(sizeof(struct radeon_bo_va), GFP_KERNEL);
> +                       if (!tmp)
> +                               return -ENOMEM;

We need to drop the lock here too.  I'll apply and fix it up.  Thanks!

Alex

>                         tmp->it.start = bo_va->it.start;
>                         tmp->it.last = bo_va->it.last;
>                         tmp->vm = vm;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
