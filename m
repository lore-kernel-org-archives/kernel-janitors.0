From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Wed, 08 May 2019 12:13:17 +0000
Subject: Re: [PATCH] net: hns3: remove redundant assignment of l2_hdr to itself
Message-Id: <e4627235-16a8-60be-4e7b-0a7e36df55c9@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508105135.13170-1-colin.king@canonical.com>
In-Reply-To: <20190508105135.13170-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019/5/8 18:51, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer l2_hdr is being assigned to itself, this is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> index 18711e0f9bdf..196a3d780dcf 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> @@ -810,7 +810,7 @@ static int hns3_set_l2l3l4(struct sk_buff *skb, u8 ol4_proto,
>  			   u8 il4_proto, u32 *type_cs_vlan_tso,
>  			   u32 *ol_type_vlan_len_msec)
>  {
> -	unsigned char *l2_hdr = l2_hdr = skb->data;
> +	unsigned char *l2_hdr = skb->data;

Reviewed-by: Yunsheng Lin <linyunsheng@huawei.com>

Thanks.

>  	u32 l4_proto = ol4_proto;
>  	union l4_hdr_info l4;
>  	union l3_hdr_info l3;
> 
