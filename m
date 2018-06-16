From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Sat, 16 Jun 2018 12:24:09 +0000
Subject: Re: [PATCH 5/5] drm/rockchip: lvds: add missing of_node_put
Message-Id: <1948755.WvuARZiism@diego>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
 <1527102436-13447-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1527102436-13447-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hi Julia,

Am Mittwoch, 23. Mai 2018, 21:07:16 CEST schrieb Julia Lawall:
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

thanks for catching this. I've added a "Fixes"-tag and
applied the patch to drm-misc-next 


Thanks
Heiko


