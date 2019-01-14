From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 14 Jan 2019 15:32:58 +0000
Subject: Re: [PATCH 3/3] drm/meson: add missing of_node_put
Message-Id: <30e505cf-fdfa-b546-c75d-5eb23366f7bb@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547372691-28324-1-git-send-email-Julia.Lawall@lip6.fr>
 <1547372691-28324-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547372691-28324-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Julia,

On 13/01/2019 10:44, Julia Lawall wrote:
> Add an of_node_put when the result of of_graph_get_remote_port_parent is
> not available.
> 
> An of_node_put is also needed when meson_probe_remote completes.  This was
> present at the recursive call, but not in the call from meson_drv_probe.
> 
> The semantic match that finds this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @r exists@
> local idexpression e;
> expression x;
> @@
> e = of_graph_get_remote_port_parent(...);
> ... when != x = e
>     when != true e = NULL
>     when != of_node_put(e)
>     when != of_fwnode_handle(e)
> (
> return e;
> |
> *return ...;
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

And applied to drm-misc-fixes.

Neil

> 
> ---
>  drivers/gpu/drm/meson/meson_drv.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3ee4d4a4e..b59c757 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -388,8 +388,10 @@ static int meson_probe_remote(struct platform_device *pdev,
>  		remote_node = of_graph_get_remote_port_parent(ep);
>  		if (!remote_node ||
>  		    remote_node = parent || /* Ignore parent endpoint */
> -		    !of_device_is_available(remote_node))
> +		    !of_device_is_available(remote_node)) {
> +			of_node_put(remote_node);
>  			continue;
> +		}
>  
>  		count += meson_probe_remote(pdev, match, remote, remote_node);
>  
> @@ -408,10 +410,13 @@ static int meson_drv_probe(struct platform_device *pdev)
>  
>  	for_each_endpoint_of_node(np, ep) {
>  		remote = of_graph_get_remote_port_parent(ep);
> -		if (!remote || !of_device_is_available(remote))
> +		if (!remote || !of_device_is_available(remote)) {
> +			of_node_put(remote);
>  			continue;
> +		}
>  
>  		count += meson_probe_remote(pdev, &match, np, remote);
> +		of_node_put(remote);
>  	}
>  
>  	if (count && !match)
> 
