From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 16:58:27 +0000
Subject: Re: [PATCH] drm/amd/display: remove redundant assignment to variable dp_ref_clk_khz
Message-Id: <CADnq5_MBQyMaLdJE=WOz4pV7u5UZQy3Y_qjL5ZO=7Y=NHQor=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410114613.15271-1-colin.king@canonical.com>
In-Reply-To: <20200410114613.15271-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  thanks!

Alex

On Fri, Apr 10, 2020 at 7:46 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable dp_ref_clk_khz is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> index 26db1c5d4e4d..b210f8e9d592 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
> @@ -131,7 +131,7 @@ int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
>         struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
>         int dprefclk_wdivider;
>         int dprefclk_src_sel;
> -       int dp_ref_clk_khz = 600000;
> +       int dp_ref_clk_khz;
>         int target_div;
>
>         /* ASSERT DP Reference Clock source is from DFS*/
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
