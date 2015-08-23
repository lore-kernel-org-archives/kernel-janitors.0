From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Date: Sun, 23 Aug 2015 01:12:42 +0000
Subject: Re: [PATCH 02/11] soc: ti: knav_qmss_queue: fix error return code
Message-Id: <55D91E0A.20602@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440288682-12732-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440288682-12732-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440288682-12732-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 8/22/15 5:11 PM, Julia Lawall wrote:
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
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
