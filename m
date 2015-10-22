From: Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 22 Oct 2015 09:21:29 +0000
Subject: Re: [PATCH 5/5] clk: scpi: add missing of_node_put
Message-Id: <5628AA99.1000000@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445460100-26727-1-git-send-email-Julia.Lawall@lip6.fr>
 <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445460100-26727-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org



On 21/10/15 21:41, Julia Lawall wrote:
> for_each_available_child_of_node performs an of_node_get on each iteration,
> so a break out of the loop requires an of_node_put.
>
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
>
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> @@
>
>   for_each_available_child_of_node(root, child) {
>     ... when != of_node_put(child)
>         when != e = child
> (
>     return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>     ...
>   }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks for the fix.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

PS: Since this driver is queued via arm-soc, it needs to go via them or
wait for v4.4-rc1 and then queue via clk tree.

-- 
Regards,
Sudeep
