From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Oct 2017 22:28:37 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix amd_powerplay_reset()
Message-Id: <CADnq5_O-xxxbvUaxHZwbYpQSP2zWDwXJD3cvhZZNzegHW2i_UA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171024094418.za4qacxapyrud2m4@mwanda>
In-Reply-To: <20171024094418.za4qacxapyrud2m4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Oct 24, 2017 at 5:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We accidentally inverted an if statement and turned amd_powerplay_reset()
> into a no-op.
>
> Fixes: ae97988fc89e ("drm/amd/powerplay: tidy up ret checks in amd_powerplay.c (v3)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
> IMHO, tidying unreadable double negatives is tricky and error prone but
> still worth it in the long run.
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 3c8ef4bfc205..0f8b6dc853a5 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -1184,7 +1184,7 @@ int amd_powerplay_reset(void *handle)
>         int ret;
>
>         ret = pp_check(instance);
> -       if (!ret)
> +       if (ret)
>                 return ret;
>
>         ret = pp_hw_fini(instance);
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
