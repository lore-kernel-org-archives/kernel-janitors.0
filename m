From: Oleksandr Andrushchenko <andr2000@gmail.com>
Date: Tue, 15 May 2018 09:12:01 +0000
Subject: Re: [PATCH][next] drm/xen-front: fix spelling mistake: "conector" -> "connector"
Message-Id: <3d506835-80af-e18d-bf53-b159caa8c0a3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180515085433.8245-1-colin.king@canonical.com>
In-Reply-To: <20180515085433.8245-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/15/2018 11:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in DRM_INFO message.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Thank you,
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Will apply to drm-misc-next
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 0e486cb1c10c..3725de4c4da8 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -623,7 +623,7 @@ static int displback_initwait(struct xen_drm_front_info *front_info)
>   	if (ret < 0)
>   		return ret;
>   
> -	DRM_INFO("Have %d conector(s)\n", cfg->num_connectors);
> +	DRM_INFO("Have %d connector(s)\n", cfg->num_connectors);
>   	/* Create event channels for all connectors and publish */
>   	ret = xen_drm_front_evtchnl_create_all(front_info);
>   	if (ret < 0)

