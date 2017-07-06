From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 06 Jul 2017 14:16:43 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: make arrays pctl0_data and pctl1_data static
Message-Id: <CADnq5_Mj4tDtVUDhziCXByOkMs_hVEdEF_GkZjYfqAgZ2x+9uA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170706095804.16456-1-colin.king@canonical.com>
In-Reply-To: <20170706095804.16456-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Hawking Zhang <Hawking.Zhang-5C7GfCeVMHo@public.gmane.org>

On Thu, Jul 6, 2017 at 5:58 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The arrays pctl0_data and pctl1_data do not need to be in global scope,
> so them both static.
>
> Cleans up sparse warnings:
> symbol 'pctl0_data' was not declared. Should it be static?
> symbol 'pctl1_data' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
> index 9804318f3488..4c079207d699 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
> @@ -249,7 +249,7 @@ struct pctl_data {
>      uint32_t data;
>  };
>
> -const struct pctl_data pctl0_data[] = {
> +static const struct pctl_data pctl0_data[] = {
>      {0x0, 0x7a640},
>      {0x9, 0x2a64a},
>      {0xd, 0x2a680},
> @@ -274,7 +274,7 @@ const struct pctl_data pctl0_data[] = {
>  #define PCTL0_STCTRL_REG_SAVE_RANGE0_BASE  0xa640
>  #define PCTL0_STCTRL_REG_SAVE_RANGE0_LIMIT 0xa833
>
> -const struct pctl_data pctl1_data[] = {
> +static const struct pctl_data pctl1_data[] = {
>      {0x0, 0x39a000},
>      {0x3b, 0x44a040},
>      {0x81, 0x2a08d},
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
