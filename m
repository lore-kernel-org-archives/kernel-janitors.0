From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 07:35:22 +0000
Subject: Re: [PATCH] staging: wilc1000: fix spelling mistake "dissconect" -> "disconnect"
Message-Id: <fe128fa2-7ba3-3d56-6b97-61bd98ebebc3@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415163330.28166-1-colin.king@canonical.com>
In-Reply-To: <20190415163330.28166-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 10:03 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a netdev_err error message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/staging/wilc1000/host_interface.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
> index e1a35bb426f9..ed15bd1bcd56 100644
> --- a/drivers/staging/wilc1000/host_interface.c
> +++ b/drivers/staging/wilc1000/host_interface.c
> @@ -774,7 +774,7 @@ int wilc_disconnect(struct wilc_vif *vif)
>   	result = wilc_send_config_pkt(vif, WILC_SET_CFG, &wid, 1,
>   				      wilc_get_vif_idx(vif));
>   	if (result) {
> -		netdev_err(vif->ndev, "Failed to send dissconect\n");
> +		netdev_err(vif->ndev, "Failed to send disconnect\n");
>   		return result;
>   	}
>   
