From: Heiko Stuebner <heiko@sntech.de>
Date: Sun, 13 Jan 2019 18:48:49 +0000
Subject: Re: [PATCH 3/4] drm/rockchip: add missing of_node_put
Message-Id: <3397932.PmTvevuZIG@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
 <1547369264-24831-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1547369264-24831-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Am Sonntag, 13. Januar 2019, 09:47:43 CET schrieb Julia Lawall:
> The device node iterators perform an of_node_get on each iteration, so a
> jump out of the loop requires an of_node_put.
> 
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> iterator name for_each_child_of_node;
> @@
> 
>  for_each_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> +  of_node_put(child);
> ?  break;
>    ...
> }
> ... when != child
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

I've added a fixes+stable tag and applied it to drm-misc-fixes

Thanks for catching that
Heiko
