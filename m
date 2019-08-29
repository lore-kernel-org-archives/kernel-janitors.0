From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Aug 2019 03:13:11 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: fix spelling mistake "jumpimng" -> "jumping"
Message-Id: <CADnq5_MrZuX4AXTv=w+7U4=Nw_6ugzErHBxXY3hhvY4-3jxGvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190829005156.26354-1-colin.king@canonical.com>
In-Reply-To: <20190829005156.26354-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied.  Thanks!

Alex

On Wed, Aug 28, 2019 at 8:52 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_DEBUG_DRIVER debug message.
> Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index 86110e6095cc..8a32b5c93778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -257,7 +257,7 @@ static uint32_t __correct_eeprom_dest_address(uint32_t curr_address)
>          * https://www.st.com/resource/en/datasheet/m24m02-dr.pdf sec. 5.1.2
>          */
>         if ((curr_address & EEPROM_ADDR_MSB_MASK) != (next_address & EEPROM_ADDR_MSB_MASK)) {
> -               DRM_DEBUG_DRIVER("Reached end of EEPROM memory page, jumpimng to next: %lx",
> +               DRM_DEBUG_DRIVER("Reached end of EEPROM memory page, jumping to next: %lx",
>                                 (next_address & EEPROM_ADDR_MSB_MASK));
>
>                 return  (next_address & EEPROM_ADDR_MSB_MASK);
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
