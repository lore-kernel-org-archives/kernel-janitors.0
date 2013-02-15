From: Kumar Gala <galak@kernel.crashing.org>
Date: Fri, 15 Feb 2013 20:02:51 +0000
Subject: Re: [PATCH 8/15] arch/powerpc/platforms/85xx/p1022_ds.c: adjust duplicate test
Message-Id: <A9025211-6E24-4730-8BEC-582CA6E9A563@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
 <1358773378-4700-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org


On Jan 21, 2013, at 7:02 AM, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive tests to the same location.  The code tested the result
> of a previous call, that itself was already tested.  It is changed to test
> the result of the most recent call.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @s exists@
> local idexpression y;
> expression x,e;
> @@
> 
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
> { ... when forall
>   return ...; }
> ... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
>    when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
> { ... when forall
>   return ...; }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> arch/powerpc/platforms/85xx/p1022_ds.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

applied to next

- k
