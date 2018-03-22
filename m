From: Walter Harms <wharms@bfs.de>
Date: Thu, 22 Mar 2018 06:47:46 +0000
Subject: Re: [PATCH] staging: wilc1000: check for kmalloc allocation failures
Message-Id: <167518706.86495.1521701282442@ox-groupware.bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321191941.4126-1-colin.king@canonical.com>
In-Reply-To: <20180321191941.4126-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.03.2018 20:19, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are three kmalloc allocations that are not null checked which
> potentially could lead to null pointer dereference issues. Fix this
> by adding null pointer return checks.
> 
> Detected by CoverityScan, CID#1466025-27 ("Dereference null return")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/wilc1000/host_interface.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/staging/wilc1000/host_interface.c
> b/drivers/staging/wilc1000/host_interface.c
> index 5082ede720f0..9b9b86654958 100644
> --- a/drivers/staging/wilc1000/host_interface.c
> +++ b/drivers/staging/wilc1000/host_interface.c
> @@ -944,6 +944,10 @@ static s32 handle_connect(struct wilc_vif *vif,
>  
>  	if (conn_attr->bssid) {
>  		hif_drv->usr_conn_req.bssid = kmalloc(6, GFP_KERNEL);
> +		if (!hif_drv->usr_conn_req.bssid) {
> +			result = -ENOMEM;
> +			goto error;
> +		}
>  		memcpy(hif_drv->usr_conn_req.bssid, conn_attr->bssid, 6);
>  	}
>  


Perhaps these malloc+memcpy can be replaced with a single kmemdup() ?

re,
 wh




> @@ -951,6 +955,10 @@ static s32 handle_connect(struct wilc_vif *vif,
>  	if (conn_attr->ssid) {
>  		hif_drv->usr_conn_req.ssid = kmalloc(conn_attr->ssid_len + 1,
>  						     GFP_KERNEL);
> +		if (!hif_drv->usr_conn_req.ssid) {
> +			result = -ENOMEM;
> +			goto error;
> +		}
>  		memcpy(hif_drv->usr_conn_req.ssid,
>  		       conn_attr->ssid,
>  		       conn_attr->ssid_len);
> @@ -961,6 +969,10 @@ static s32 handle_connect(struct wilc_vif *vif,
>  	if (conn_attr->ies) {
>  		hif_drv->usr_conn_req.ies = kmalloc(conn_attr->ies_len,
>  						    GFP_KERNEL);
> +		if (!hif_drv->usr_conn_req.ies) {
> +			result = -ENOMEM;
> +			goto error;
> +		}
>  		memcpy(hif_drv->usr_conn_req.ies,
>  		       conn_attr->ies,
>  		       conn_attr->ies_len);
