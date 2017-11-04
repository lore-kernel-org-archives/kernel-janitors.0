From: walter harms <wharms@bfs.de>
Date: Sat, 04 Nov 2017 09:16:23 +0000
Subject: Re: [PATCH] drm/amd/display: indent an if statement
Message-Id: <59FD8567.4030500@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
In-Reply-To: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org, Yue Hin Lau <Yuehin.Lau@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <tony.cheng@amd.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>



Am 04.11.2017 07:12, schrieb Dan Carpenter:
> The if statement wasn't indented so it makes static analysis tools and
> probably very recent GCC versions complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I went over 80 characters because other lines do already and it seemed
> like the cleanest thing here.
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index d911590d08bc..c83ac4d9ca3a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -727,7 +727,7 @@ static void destruct(struct dcn10_resource_pool *pool)
>  
>  	for (i = 0; i < pool->base.stream_enc_count; i++) {
>  		if (pool->base.stream_enc[i] != NULL)
> -		kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
> +			kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
>  	}
>  

Is that "if (pool->base.stream_enc[i] != NULL)" needed at all ?
kfree() should happily handle NULL.

re,
 wh



>  	for (i = 0; i < pool->base.audio_count; i++) {
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
