From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Date: Wed, 16 Sep 2020 15:49:00 +0000
Subject: Re: [PATCH] i40e, xsk: uninitialized variable in i40e_clean_rx_irq_zc()
Message-Id: <850c79f4-de8a-1132-0e37-facbc09e4dfb@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200916143228.GA764370@mwanda>
In-Reply-To: <20200916143228.GA764370@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 2020-09-16 16:32, Dan Carpenter wrote:
> The "failure" variable is used without being initialized.  It should be
> set to false.
> 
> Fixes: 8cbf74149903 ("i40e, xsk: move buffer allocation out of the Rx processing loop")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan!

Acked-by: Björn Töpel <bjorn.topel@intel.com>

> ---
>   drivers/net/ethernet/intel/i40e/i40e_xsk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_xsk.c b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> index 6acede0acdca..567fd67e900e 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_xsk.c
> @@ -281,8 +281,8 @@ int i40e_clean_rx_irq_zc(struct i40e_ring *rx_ring, int budget)
>   	unsigned int total_rx_bytes = 0, total_rx_packets = 0;
>   	u16 cleaned_count = I40E_DESC_UNUSED(rx_ring);
>   	unsigned int xdp_res, xdp_xmit = 0;
> +	bool failure = false;
>   	struct sk_buff *skb;
> -	bool failure;
>   
>   	while (likely(total_rx_packets < (unsigned int)budget)) {
>   		union i40e_rx_desc *rx_desc;
> 
