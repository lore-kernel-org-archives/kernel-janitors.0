From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 02 Dec 2019 21:38:56 +0000
Subject: Re: [PATCH] drm/amd/display: remove redundant assignment to variable v_total
Message-Id: <CADnq5_Mtos36z7vp92ep4hQtW3KFeGb8EbWsGbhOGXJSebdVDA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191202154738.56812-1-colin.king@canonical.com>
In-Reply-To: <20191202154738.56812-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  thanks!

Alex

On Mon, Dec 2, 2019 at 10:47 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable v_total is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index 16e69bbc69aa..fa57885503d4 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -122,7 +122,7 @@ static unsigned int calc_v_total_from_refresh(
>                 const struct dc_stream_state *stream,
>                 unsigned int refresh_in_uhz)
>  {
> -       unsigned int v_total = stream->timing.v_total;
> +       unsigned int v_total;
>         unsigned int frame_duration_in_ns;
>
>         frame_duration_in_ns > --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
