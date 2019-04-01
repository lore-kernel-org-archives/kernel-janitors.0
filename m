From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 01 Apr 2019 12:59:03 +0000
Subject: Re: [PATCH 12/12] drivers: firmware: psci: add missing of_node_put after of_device_is_available
Message-Id: <9b159e80-1ad2-0254-9543-852e1d7f04f9@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org


On 2/23/2019 6:50 PM, Julia Lawall wrote:
> Add an of_node_put when a tested device node is not available.
>
> The semantic patch that fixes this problem is as follows
> (http://Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
>
> Cheers,
> -Mukesh.lip6.fr):
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
> Fixes: d09a0011ec0d5 ("drivers: psci: Allow PSCI node to be disabled")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
>
> ---
>   drivers/firmware/psci.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff -u -p a/drivers/firmware/psci.c b/drivers/firmware/psci.c
> --- a/drivers/firmware/psci.c
> +++ b/drivers/firmware/psci.c
> @@ -677,8 +677,10 @@ int __init psci_dt_init(void)
>   
>   	np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
>   
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>   		return -ENODEV;
> +	}
>   
>   	init_fn = (psci_initcall_t)matched_np->data;
>   	return init_fn(np);
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
