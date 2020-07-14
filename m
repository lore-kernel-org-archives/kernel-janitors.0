From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jul 2020 15:08:29 +0000
Subject: Re: [PATCH] drm/amd/display: remove an unnecessary NULL check
Message-Id: <CADnq5_PjbNie+rdxttjYuykhWSC4VrE+U+xFYeYurvYixeiPVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714105700.GC294318@mwanda>
In-Reply-To: <20200714105700.GC294318@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>, Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Anthony Koo <Anthony.Koo@amd.com>

On Tue, Jul 14, 2020 at 6:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "stream" pointer can't be NULL and it's dereferenced on the line
> before so the check doesn't make sense.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 4f97329d9daf..7e58f242dab9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2324,7 +2324,7 @@ static void commit_planes_for_stream(struct dc *dc,
>
>         if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
>                 if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> -                       if (stream && should_use_dmub_lock(stream->link)) {
> +                       if (should_use_dmub_lock(stream->link)) {
>                                 union dmub_hw_lock_flags hw_locks = { 0 };
>                                 struct dmub_hw_lock_inst_flags inst_flags = { 0 };
>
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
