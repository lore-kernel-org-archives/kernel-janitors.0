From: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Fri, 08 May 2020 11:26:27 +0000
Subject: Re: [PATCH net-next v2] net: ethernet: ti: fix some return value check of cpsw_ale_create()
Message-Id: <da50aa53-a967-83b7-0737-701ab30228e4@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508021059.172001-1-weiyongjun1@huawei.com>
 <20200508100649.1112-1-weiyongjun1@huawei.com>
In-Reply-To: <20200508100649.1112-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>, "David S . Miller" <davem@davemloft.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>



On 08/05/2020 13:06, Wei Yongjun wrote:
> cpsw_ale_create() can return both NULL and PTR_ERR(), but all of
> the caller only check NULL for error handling. This patch convert
> it to only return PTR_ERR() in all error cases, all the caller using
> IS_ERR() install of NULL test.
> 
> Also fix a return negative error code from the cpsw_ale_create()
> error handling case instead of 0 in am65_cpsw_nuss_probe().
> 
> Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> Fixes: 4b41d3436796 ("net: ethernet: ti: cpsw: allow untagged traffic on host port")

^ I do not think it can be back-ported so far back.
So, or drop second "Fixes: 4b41d3436796"
or split am65-cpsw-nuss.c changes

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: fix cpsw_ale_create() to retuen PTR_ERR() in all places as Grygorii's suggest

Pls, do not send v2 as reply on v1.


> ---
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ++-
>   drivers/net/ethernet/ti/cpsw_ale.c       | 2 +-
>   drivers/net/ethernet/ti/cpsw_priv.c      | 4 ++--
>   drivers/net/ethernet/ti/netcp_ethss.c    | 4 ++--
>   4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index 8cdbb2b9b13a..5530d7ef77a6 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -2074,8 +2074,9 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
>   	ale_params.nu_switch_ale = true;
>   
>   	common->ale = cpsw_ale_create(&ale_params);
> -	if (!common->ale) {
> +	if (IS_ERR(common->ale)) {
>   		dev_err(dev, "error initializing ale engine\n");
> +		ret = ERR_PTR(common->ale);

../include/linux/err.h:24:35: note: expected ‘long int’ but argument is of type ‘struct cpsw_ale *’
  static inline void * __must_check ERR_PTR(long error)
                                    ^~~~~~~
../drivers/net/ethernet/ti/am65-cpsw-nuss.c:1900:7: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
    ret = ERR_PTR(common->ale);
        ^


>   		goto err_of_clear;
>   	}
>   
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 0374e6936091..8dc6be11b2ff 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -955,7 +955,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
>   
>   	ale = devm_kzalloc(params->dev, sizeof(*ale), GFP_KERNEL);
>   	if (!ale)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	ale->p0_untag_vid_mask >   		devm_kmalloc_array(params->dev, BITS_TO_LONGS(VLAN_N_VID),
> diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
> index 9d098c802c6d..d940628bff8d 100644
> --- a/drivers/net/ethernet/ti/cpsw_priv.c
> +++ b/drivers/net/ethernet/ti/cpsw_priv.c
> @@ -504,9 +504,9 @@ int cpsw_init_common(struct cpsw_common *cpsw, void __iomem *ss_regs,
>   	ale_params.ale_ports		= CPSW_ALE_PORTS_NUM;
>   
>   	cpsw->ale = cpsw_ale_create(&ale_params);
> -	if (!cpsw->ale) {
> +	if (IS_ERR(cpsw->ale)) {
>   		dev_err(dev, "error initializing ale engine\n");
> -		return -ENODEV;
> +		return PTR_ERR(cpsw->ale);
>   	}
>   
>   	dma_params.dev		= dev;
> diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
> index 9d6e27fb710e..28093923a7fb 100644
> --- a/drivers/net/ethernet/ti/netcp_ethss.c
> +++ b/drivers/net/ethernet/ti/netcp_ethss.c
> @@ -3704,9 +3704,9 @@ static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
>   		ale_params.nu_switch_ale = true;
>   	}
>   	gbe_dev->ale = cpsw_ale_create(&ale_params);
> -	if (!gbe_dev->ale) {
> +	if (IS_ERR(gbe_dev->ale)) {
>   		dev_err(gbe_dev->dev, "error initializing ale engine\n");
> -		ret = -ENODEV;
> +		ret = PTR_ERR(gbe_dev->ale);
>   		goto free_sec_ports;
>   	} else {
>   		dev_dbg(gbe_dev->dev, "Created a gbe ale engine\n");
> 

-- 
Best regards,
grygorii
