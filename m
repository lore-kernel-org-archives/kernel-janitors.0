From: maowenan <maowenan@huawei.com>
Date: Mon, 18 Feb 2019 13:25:06 +0000
Subject: Re: [PATCH net-next] cfg80211: pmsr: use eth_broadcast_addr() to assign broadcast address
Message-Id: <927ff17c-c506-734f-fc27-796d4c8fba98@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216094710.127182-1-maowenan@huawei.com>
In-Reply-To: <20190216094710.127182-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, kvalo@codeaurora.org

Add kalle Valo in mail list.

Hi Kalle Valo,
Do you have any comments about this patch?

On 2019/2/16 17:47, Mao Wenan wrote:
> This patch is to use eth_broadcast_addr() to assign broadcast address
> insetad of memset().
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  net/wireless/pmsr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/wireless/pmsr.c b/net/wireless/pmsr.c
> index de9286703280..21139b82749f 100644
> --- a/net/wireless/pmsr.c
> +++ b/net/wireless/pmsr.c
> @@ -258,7 +258,7 @@ int nl80211_pmsr_start(struct sk_buff *skb, struct genl_info *info)
>  	} else {
>  		memcpy(req->mac_addr, nla_data(info->attrs[NL80211_ATTR_MAC]),
>  		       ETH_ALEN);
> -		memset(req->mac_addr_mask, 0xff, ETH_ALEN);
> +		eth_broadcast_addr(req->mac_addr_mask);
>  	}
>  
>  	idx = 0;
> 
