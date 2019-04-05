From: Mukesh Ojha <mojha@codeaurora.org>
Date: Fri, 05 Apr 2019 14:22:32 +0000
Subject: Re: [PATCH][next] net: hns: fix unsigned comparison to less than zero
Message-Id: <ec5863a5-ab4a-7dca-0188-adb8a1dc4889@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190405135916.1621-1-colin.king@canonical.com>
In-Reply-To: <20190405135916.1621-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Yonglong Liu <liuyonglong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/5/2019 7:29 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently mskid is unsigned and hence comparisons with negative
> error return values are always false. Fix this by making mskid an
> int.
>
> Fixes: f058e46855dc ("net: hns: fix ICMP6 neighbor solicitation messages discard problem")
> Addresses-Coverity: ("Operands don't affect result")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> index 61eea6ac846f..e05d2095d09b 100644
> --- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> +++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
> @@ -2769,7 +2769,7 @@ static void set_promisc_tcam_enable(struct dsaf_device *dsaf_dev, u32 port)
>   	struct hns_mac_cb *mac_cb;
>   	u8 addr[ETH_ALEN] = {0};
>   	u8 port_num;
> -	u16 mskid;
> +	int mskid;
>   
>   	/* promisc use vague table match with vlanid = 0 & macaddr = 0 */
>   	hns_dsaf_set_mac_key(dsaf_dev, &mac_key, 0x00, port, addr);
