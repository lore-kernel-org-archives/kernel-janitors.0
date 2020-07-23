From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jul 2020 20:23:13 +0000
Subject: Re: [PATCH] drm/amd/display: remove redundant initialization of variable result
Message-Id: <CADnq5_NicLnGDbk6XsT4Ux1nPNNgDu84kAPJfGJANQ9YWrcFuw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723143637.991988-1-colin.king@canonical.com>
In-Reply-To: <20200723143637.991988-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Thu, Jul 23, 2020 at 10:36 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable result is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> index 5d83e8174005..0853bc9917c7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> @@ -1017,7 +1017,7 @@ enum dc_status dce112_add_stream_to_ctx(
>                 struct dc_state *new_ctx,
>                 struct dc_stream_state *dc_stream)
>  {
> -       enum dc_status result = DC_ERROR_UNEXPECTED;
> +       enum dc_status result;
>
>         result = resource_map_pool_resources(dc, new_ctx, dc_stream);
>
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
