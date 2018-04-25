From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Apr 2018 09:21:55 +0000
Subject: Re: [PATCH] drm/amdkfd: Integer overflows in ioctl
Message-Id: <20180425092155.ibca4sdsxr553ouv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424133549.GB10167@mwanda>
 <e2b7b3c1-cadb-330f-53a8-57568d4bc877@amd.com>
In-Reply-To: <e2b7b3c1-cadb-330f-53a8-57568d4bc877-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <felix.kuehling-5C7GfCeVMHo@public.gmane.org>
Cc: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Tue, Apr 24, 2018 at 02:58:10PM -0400, Felix Kuehling wrote:
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> We could probably add a sanity check for n_devices to avoid user mode
> causing excessive memory allocations in the kernel. There is no good
> reason for this to be bigger than the number of GPUs in the system. The
> maximum number of GPUs supported due to device minor limit in DRM is 128.
> 

128 is sort of a magic number.  Is there a MAX_GPU define or something?

regards,
dan carpenter

