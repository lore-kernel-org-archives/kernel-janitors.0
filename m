From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Date: Fri, 28 Feb 2020 13:08:46 +0000
Subject: Re: [PATCH v2] drm/amd/display: Fix dmub_psr_destroy()
Message-Id: <e425f3fd-a517-c10b-aab4-05d8315983de@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228105833.2jdsy7sxpeoo3lvy@kili.mountain>
In-Reply-To: <20200228105833.2jdsy7sxpeoo3lvy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Harry Wentland <harry.wentland@amd.com>, Wyatt Wood <wyatt.wood@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

On 2020-02-28 5:58 a.m., Dan Carpenter wrote:
> This is freeing the wrong variable so it will crash.  It should be
> freeing "*dmub" instead of "dmub".
> 
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..f0936cb3c056 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -235,6 +235,6 @@ struct dmub_psr *dmub_psr_create(struct dc_context *ctx)
>    */
>   void dmub_psr_destroy(struct dmub_psr **dmub)
>   {
> -	kfree(dmub);
> +	kfree(*dmub);
>   	*dmub = NULL;
>   }
> 
