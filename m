From: Michal Simek <michal.simek@xilinx.com>
Date: Mon, 15 Jun 2020 08:55:42 +0000
Subject: Re: [PATCH] net: axienet: fix spelling mistake in comment "Exteneded" -> "extended"
Message-Id: <1e0ddd7d-5fd5-ec2a-2cda-ab3924de4762@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200615082911.7252-1-colin.king@canonical.com>
In-Reply-To: <20200615082911.7252-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Simek <michal.simek@xilinx.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15. 06. 20 10:29, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a comment. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index fbaf3c987d9c..f34c7903ff52 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -186,7 +186,7 @@
>  #define XAE_RAF_TXVSTRPMODE_MASK	0x00000180 /* Tx VLAN STRIP mode */
>  #define XAE_RAF_RXVSTRPMODE_MASK	0x00000600 /* Rx VLAN STRIP mode */
>  #define XAE_RAF_NEWFNCENBL_MASK		0x00000800 /* New function mode */
> -/* Exteneded Multicast Filtering mode */
> +/* Extended Multicast Filtering mode */
>  #define XAE_RAF_EMULTIFLTRENBL_MASK	0x00001000
>  #define XAE_RAF_STATSRST_MASK		0x00002000 /* Stats. Counter Reset */
>  #define XAE_RAF_RXBADFRMEN_MASK		0x00004000 /* Recv Bad Frame Enable */
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
