From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 24 Oct 2017 10:11:07 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix amd_powerplay_reset()
Message-Id: <87k1zkj1ok.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171024094418.za4qacxapyrud2m4@mwanda>
In-Reply-To: <20171024094418.za4qacxapyrud2m4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, 24 Oct 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We accidentally inverted an if statement and turned amd_powerplay_reset()
> into a no-op.
>
> Fixes: ae97988fc89e ("drm/amd/powerplay: tidy up ret checks in amd_powerplay.c (v3)")

For some reason I looked up that commit, and it has *two* cases where
"ret != 0" gets changed to "!ret".

BR,
Jani.


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> IMHO, tidying unreadable double negatives is tricky and error prone but
> still worth it in the long run.
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> index 3c8ef4bfc205..0f8b6dc853a5 100644
> --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
> @@ -1184,7 +1184,7 @@ int amd_powerplay_reset(void *handle)
>  	int ret;
>  
>  	ret = pp_check(instance);
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  
>  	ret = pp_hw_fini(instance);
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
