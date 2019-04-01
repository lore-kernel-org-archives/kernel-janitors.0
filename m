From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 01 Apr 2019 12:50:02 +0000
Subject: Re: [PATCH 03/12] PowerPC-83xx: add missing of_node_put after of_device_is_available
Message-Id: <b74c558e-651b-458b-05ee-3adf5d06a685@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Scott Wood <oss@buserror.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org


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
> Fixes: c026c98739c7e ("powerpc/83xx: Do not configure or probe disabled FSL DR USB controllers")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
>
> ---
>   arch/powerpc/platforms/83xx/usb.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff -u -p a/arch/powerpc/platforms/83xx/usb.c b/arch/powerpc/platforms/83xx/usb.c
> --- a/arch/powerpc/platforms/83xx/usb.c
> +++ b/arch/powerpc/platforms/83xx/usb.c
> @@ -221,8 +221,10 @@ int mpc837x_usb_cfg(void)
>   	int ret = 0;
>   
>   	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>   		return -ENODEV;
> +	}
>   	prop = of_get_property(np, "phy_type", NULL);
>   
>   	if (!prop || (strcmp(prop, "ulpi") && strcmp(prop, "serial"))) {
>
