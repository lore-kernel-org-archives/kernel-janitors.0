From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 01 Apr 2019 12:48:44 +0000
Subject: Re: [PATCH 01/12] arm-cci: add missing of_node_put after of_device_is_available
Message-Id: <2be57c65-f94c-0a64-8fa6-385f60833bb6@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, robin.murphy@arm.com
Cc: kernel-janitors@vger.kernel.org


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
> Fixes: 896ddd600ba4 ("drivers: bus: check cci device tree node status")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

>
> ---
> This file doesn't seem to have a maintainer.
>
>   drivers/bus/arm-cci.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff -u -p a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> --- a/drivers/bus/arm-cci.c
> +++ b/drivers/bus/arm-cci.c
> @@ -538,8 +538,10 @@ static int cci_probe(void)
>   	struct resource res;
>   
>   	np = of_find_matching_node(NULL, arm_cci_matches);
> -	if (!of_device_is_available(np))
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
>   		return -ENODEV;
> +	}
>   
>   	ret = of_address_to_resource(np, 0, &res);
>   	if (!ret) {
>
