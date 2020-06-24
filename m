From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 15:16:27 +0000
Subject: Re: [PATCH][next] drm/amdgpu: ensure 0 is returned for success in jpeg_v2_5_wait_for_idle
Message-Id: <CADnq5_PySz6YWOMM4kosC_B83i+jsPKmf0puMt3sw2C-hExa3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624145418.7794-1-colin.king@canonical.com>
In-Reply-To: <20200624145418.7794-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Jun 24, 2020 at 10:54 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the cases where adev->jpeg.num_jpeg_inst is zero or the condition
> adev->jpeg.harvest_config & (1 << i) is always non-zero the variable
> ret is never set to an error condition and the function returns
> an uninitialized value in ret.  Since the only exit condition at
> the end if the function is a success then explicitly return
> 0 rather than a potentially uninitialized value in ret.

We should actually never hit this condition in practice because the
driver won't initialize this module if all of the instances are
harvested, but better safe than sorry.  Applied.

Thanks,

Alex

>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 14f43e8f88c5 ("drm/amdgpu: move JPEG2.5 out from VCN2.5")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> index f74262a22a16..7a51c615d22d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
> @@ -462,7 +462,7 @@ static int jpeg_v2_5_wait_for_idle(void *handle)
>                         return ret;
>         }
>
> -       return ret;
> +       return 0;
>  }
>
>  static int jpeg_v2_5_set_clockgating_state(void *handle,
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
