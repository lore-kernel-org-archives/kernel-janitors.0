From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 09 Nov 2017 17:53:18 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix copy-n-paste error on vddci_buf index
Message-Id: <CADnq5_OTQyAuY-LStNO4oF+K+H5DW3bfsE1ncM3dmscD5Dxrfg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109113500.19593-1-colin.king@canonical.com>
In-Reply-To: <20171109113500.19593-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Edward O'Callaghan <funfunctor-dczkZgxz+BNUPWh3PAxdjQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, Nov 9, 2017 at 6:35 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The index to vddci_buf is using profile->ucElbVDDC_Num rather
> than profile->ucElbVDDCI_Num; this looks like a copy-n-paste
> error from previous code for the vddc_buf array and I'm pretty
> sure this is incorrect. Fix this by using the correct variable.
>
> Detected by CoverityScan, CID#1457172 ("Copy-paste error")
>
> Fixes: 970d9804b00d ("drm/amd/powerplay: Add support functions for CI to ppatomctrl.c")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
> index a129bc5b1844..c6febbf0bf69 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
> @@ -1486,7 +1486,7 @@ int atomctrl_get_leakage_vddc_base_on_leakage(struct pp_hwmgr *hwmgr,
>                                 if (vddci_id_buf[i] = virtual_voltage_id) {
>                                         for (j = 0; j < profile->ucLeakageBinNum; j++) {
>                                                 if (efuse_voltage_id <= leakage_bin[j]) {
> -                                                       *vddci = vddci_buf[j * profile->ucElbVDDC_Num + i];
> +                                                       *vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
>                                                         break;
>                                                 }
>                                         }
> --
> 2.14.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
