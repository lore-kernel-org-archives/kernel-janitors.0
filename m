From: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Date: Thu, 29 Nov 2018 02:43:47 +0000
Subject: Re: [PATCH net-next] net: qualcomm: rmnet: Remove set but not used variable 'cmd'
Message-Id: <4a9a436323e65a2bd1357bf49c687ec8@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543458992-103568-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543458992-103568-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2018-11-28 19:36, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c: In function
> 'rmnet_map_do_flow_control':
> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:23:36: warning:
>  variable 'cmd' set but not used [-Wunused-but-set-variable]
>   struct rmnet_map_control_command *cmd;
> 
> 'cmd' not used anymore now, should also be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> index 8990307..f6cf59a 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
> @@ -20,14 +20,12 @@ static u8 rmnet_map_do_flow_control(struct sk_buff 
> *skb,
>  				    struct rmnet_port *port,
>  				    int enable)
>  {
> -	struct rmnet_map_control_command *cmd;
>  	struct rmnet_endpoint *ep;
>  	struct net_device *vnd;
>  	u8 mux_id;
>  	int r;
> 
>  	mux_id = RMNET_MAP_GET_MUX_ID(skb);
> -	cmd = RMNET_MAP_GET_CMD_START(skb);
> 
>  	if (mux_id >= RMNET_MAX_LOGICAL_EP) {
>  		kfree_skb(skb);

Thanks for cleaning these up.

Acked-by: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
