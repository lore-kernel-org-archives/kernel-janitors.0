From: Kumar Gala <galak@kernel.crashing.org>
Date: Fri, 06 Feb 2009 16:44:44 +0000
Subject: Re: [PATCH] arch/powerpc: Eliminate double sizeof
Message-Id: <67331C84-5400-4FE5-B6FA-395F13A482F8@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902042236200.3091@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902042236200.3091@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On Feb 4, 2009, at 3:43 PM, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
>
> Taking sizeof the result of sizeof is quite strange and does not  
> seem to be
> what is wanted here.
>
> This was fixed using the following semantic patch.
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@
> expression E;
> @@
>
> - sizeof (
>  sizeof (E)
> - )
>
> @@
> type T;
> @@
>
> - sizeof (
>  sizeof (T)
> - )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
> arch/powerpc/platforms/82xx/pq2ads-pci-pic.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

applied

- k
