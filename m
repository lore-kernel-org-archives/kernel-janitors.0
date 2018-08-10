From: Bas Nieuwenhuizen <basni@chromium.org>
Date: Fri, 10 Aug 2018 11:12:25 +0000
Subject: Re: [PATCH] drm/amdgpu: fix integer overflow test in amdgpu_bo_list_create()
Message-Id: <CAC4kW=17zmypYqmALjqggyZoCe10T9xV0ssQL-kNLr8DPZf-KQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180810105032.cltqjuv7tqfud7n6@kili.mountain>
In-Reply-To: <20180810105032.cltqjuv7tqfud7n6-vMlZ3nK25oGAIHFoDFOv9A@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: David1.Zhou-5C7GfCeVMHo@public.gmane.org, andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, cakturk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, kent.russell-5C7GfCeVMHo@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Reviewed-by: Bas Nieuwenhuizen <basni@chromium.org>
On Fri, Aug 10, 2018 at 12:50 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally left out the size of the amdgpu_bo_list struct.  It
> could lead to memory corruption on 32 bit systems.  You'd have to
> pick the absolute maximum and set "num_entries = 59652323" then size
> would wrap to 16 bytes.
>
> Fixes: 920990cb080a ("drm/amdgpu: allocate the bo_list array after the list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index d472a2c8399f..b80243d3972e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -67,7 +67,8 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>         unsigned i;
>         int r;
>
> -       if (num_entries > SIZE_MAX / sizeof(struct amdgpu_bo_list_entry))
> +       if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
> +                               / sizeof(struct amdgpu_bo_list_entry))
>                 return -EINVAL;
>
>         size = sizeof(struct amdgpu_bo_list);
