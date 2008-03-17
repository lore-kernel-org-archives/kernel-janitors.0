From: "Kok, Auke" <auke-jan.h.kok@intel.com>
Date: Mon, 17 Mar 2008 16:37:48 +0000
Subject: Re: [PATCH 5/7] drivers/net/ixgb/ixgb_main.c: remove unused variable
Message-Id: <47DE9E5C.6080603@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803151703520.24178@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803151703520.24178@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jeffrey.t.kirsher@intel.com, ayyappan.veeraiyan@intel.com, john.ronciak@intel.com, jesse.brandeburg@intel.com, auke-jan.h.kok@intel.com, e1000-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


OK, i'll pass it along. ty

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The variable num_group_tail_writes is initialized but never used otherwise.
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
>  drivers/net/ixgb/ixgb_main.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff -u -p a/drivers/net/ixgb/ixgb_main.c b/drivers/net/ixgb/ixgb_main.c
> --- a/drivers/net/ixgb/ixgb_main.c 2008-03-12 14:13:13.000000000 +0100
> +++ b/drivers/net/ixgb/ixgb_main.c 2008-03-15 11:16:23.000000000 +0100
> @@ -2088,14 +2088,12 @@ ixgb_alloc_rx_buffers(struct ixgb_adapte
>  	struct ixgb_buffer *buffer_info;
>  	struct sk_buff *skb;
>  	unsigned int i;
> -	int num_group_tail_writes;
>  	long cleancount;
>  
>  	i = rx_ring->next_to_use;
>  	buffer_info = &rx_ring->buffer_info[i];
>  	cleancount = IXGB_DESC_UNUSED(rx_ring);
>  
> -	num_group_tail_writes = IXGB_RX_BUFFER_WRITE;
>  
>  	/* leave three descriptors unused */
>  	while(--cleancount > 2) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

