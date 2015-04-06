From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Date: Mon, 06 Apr 2015 02:03:15 +0000
Subject: Re: [PATCH 14/16] soc: ti: knav_qmss_queue: fix error return code
Message-Id: <5521E963.5080903@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428235596-4757-15-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-15-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 4/5/15 5:06 AM, Julia Lawall wrote:
> Return a negative error code on failure.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier ret; expression e1,e2;
> @@
> (
> if (\(ret < 0\|ret != 0\))
>   { ... return ret; }
> |
> ret = 0
> )
> ... when != ret = e1
>      when != &ret
> *if(...)
> {
>    ... when != ret = e2
>        when forall
>   return ret;
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
