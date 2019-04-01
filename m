From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 01 Apr 2019 12:58:41 +0000
Subject: Re: [PATCH 07/12] drm: omapdrm: add missing of_node_put after of_device_is_available
Message-Id: <572cbf04-d97a-9807-75b5-2cf6f752667b@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org


On 2/23/2019 6:50 PM, Julia Lawall wrote:
> Add an of_node_put when a tested device node is not available.
>
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @@
> identifier f;
> local idexpression e;
> expression x;
> @@
>
> e = f(...);
> ... when != of_node_put(e)
>      when != x = e
>      when != e = x
>      when any
> if (<+...of_device_is_available(e)...+>) {
>    ... when != of_node_put(e)
> (
>    return e;
> |
> + of_node_put(e);
>    return ...;
> )
> }
> // </smpl>
>
> Fixes: f2dd36ac9974c ("OMAPDSS: move 'compatible' converter to omapdss driver")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

>
> ---
>   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff -u -p a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> @@ -192,8 +192,10 @@ static int __init omapdss_boot_init(void
>   
>   	dss = of_find_matching_node(NULL, omapdss_of_match);
>   
> -	if (dss = NULL || !of_device_is_available(dss))
> +	if (dss = NULL || !of_device_is_available(dss)) {
> +		of_node_put(dss);
>   		return 0;
> +	}
>   
>   	omapdss_walk_device(dss, true);
>   
>
