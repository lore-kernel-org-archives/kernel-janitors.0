From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Dec 2020 15:08:22 +0000
Subject: Re: [PATCH 0/2] drm/amd/display: Adjustments for dc_create()
Message-Id: <CADnq5_PVm+04LqPJoQ6mPHf0YM6jEeR_Xh_Bkap7Nuw+Fo6sgw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
In-Reply-To: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Aric Cyr <aric.cyr@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Chiawen Huang <chiawen.huang@amd.com>, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Yongqiang Sun <yongqiang.sun@amd.com>, Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Alvin Lee <alvin.lee2@amd.com>

On Sun, Dec 20, 2020 at 6:10 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 19 Dec 2020 18:30:56 +0100
>
> Two update suggestions were taken into account
> from static source code analysis.
>

Applied.  Thanks!

Alex


> Markus Elfring (2):
>   Return directly after a failed kzalloc()
>   Use common error handling code
>
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
