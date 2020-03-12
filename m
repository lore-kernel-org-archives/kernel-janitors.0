From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 14:23:02 +0000
Subject: Re: [PATCH] drm/amdgpu/display: clean up some indenting
Message-Id: <CADnq5_Or06=BeVmnx35vSqvK1vUxx+Vvzq9h=UY7OkRU+SK+4Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224103120.zrvgqaokmoehs5y7@kili.mountain>
In-Reply-To: <20200224103120.zrvgqaokmoehs5y7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Francis <David.Francis@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

On Mon, Feb 24, 2020 at 5:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These lines were accidentally indented 4 spaces more than they should
> be.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4cb3eb7c6745..408405d9f30c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2138,10 +2138,10 @@ static void handle_hpd_rx_irq(void *param)
>                 }
>         }
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
> -           if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
> -                   if (adev->dm.hdcp_workqueue)
> -                           hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
> -           }
> +       if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
> +               if (adev->dm.hdcp_workqueue)
> +                       hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
> +       }
>  #endif
>         if ((dc_link->cur_link_settings.lane_count != LANE_COUNT_UNKNOWN) ||
>             (dc_link->type = dc_connection_mst_branch))
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
