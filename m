From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 07 Oct 2019 16:30:41 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix a && vs || typo
Message-Id: <CADnq5_NHDwYhF+Z7Kn6a4=qp9S9==7hSjKWQWwsJT9SPTdfePg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007085210.GC3865@mwanda>
In-Reply-To: <20191007085210.GC3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yong Zhao <Yong.Zhao@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Oct 7, 2019 at 4:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In the current code if "device_info" is ever NULL then the kernel will
> Oops so probably || was intended instead of &&.
>
> Fixes: e392c887df97 ("drm/amdkfd: Use array to probe kfd2kgd_calls")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 0db273587af4..070c9b5593c9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -498,7 +498,7 @@ struct kfd_dev *kgd2kfd_probe(struct kgd_dev *kgd,
>         device_info = kfd_supported_devices[asic_type][vf];
>         f2g = kfd2kgd_funcs[asic_type];
>
> -       if (!device_info && !f2g) {
> +       if (!device_info || !f2g) {
>                 dev_err(kfd_device, "%s %s not supported in kfd\n",
>                         amdgpu_asic_name[asic_type], vf ? "VF" : "");
>                 return NULL;
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
