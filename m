From: Kumar Gala <galak@kernel.crashing.org>
Date: Fri, 07 Aug 2009 02:26:59 +0000
Subject: Re: [PATCH 1/3] arch/powerpc: Add kmalloc NULL tests
Message-Id: <FD045DD8-3932-4BA0-9AB9-C2405F601C45@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908062203380.19100@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908062203380.19100@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, paulus@samba.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org


On Aug 6, 2009, at 3:04 PM, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
>
> Check that the result of kmalloc/kzalloc is not NULL before  
> dereferencing it.
>
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression *x;
> identifier f;
> constant char *C;
> @@
>
> x = \(kmalloc\|kcalloc\|kzalloc\)(...);
> ... when != x = NULL
>    when != x != NULL
>    when != (x || ...)
> (
> kfree(x)
> |
> f(...,C,...,x,...)
> |
> *f(...,x,...)
> |
> *x->f
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> arch/powerpc/sysdev/fsl_rio.c       |   18 ++++++++++++++----
> 1 files changed, 14 insertions(+), 4 deletions(-)


applied to next

- k
