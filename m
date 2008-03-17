From: Jeff Garzik <jgarzik@pobox.com>
Date: Mon, 17 Mar 2008 11:58:38 +0000
Subject: Re: [PATCH 6/7] drivers/net/ipg.c: remove unused variable
Message-Id: <47DE5CEE.5070200@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803151704150.24178@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803151704150.24178@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jesse@icplus.com.tw, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The variable gig is initialized but never used otherwise.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> type T;
> identifier i;
> constant C;
> @@
> 
> (
> extern T i;
> |
> - T i;
>   <+... when != i
> - i = C;
>   ...+>
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/net/ipg.c |    3 ---
>  1 file changed, 3 deletions(-)

applied


