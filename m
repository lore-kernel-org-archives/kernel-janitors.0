From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Date: Mon, 26 Mar 2018 17:50:44 +0000
Subject: Re: [PATCH] staging: wilc1000: replace kmalloc + memcpy with kmemdup
Message-Id: <c65d1ac5-d5bc-3703-9516-45173a37bac4@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180326171629.28700-1-colin.king@canonical.com>
In-Reply-To: <20180326171629.28700-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 26/03/2018 à 19:16, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> Replace several allocation and memcpys with kmemdup and add in some
> missing memory allocation failure checks.  Also fix an incorrect
> -EFAULT return with -ENOMEM.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/wilc1000/host_interface.c | 75 +++++++++++++++++++------------
>   1 file changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
> index 9b9b86654958..8fd367f87fa5 100644
> --- a/drivers/staging/wilc1000/host_interface.c
> +++ b/drivers/staging/wilc1000/host_interface.c
[...]
>   
>   	hif_drv->usr_conn_req.ssid_len = conn_attr->ssid_len;
>   	if (conn_attr->ssid) {
> -		hif_drv->usr_conn_req.ssid = kmalloc(conn_attr->ssid_len + 1,
> +		hif_drv->usr_conn_req.ssid = kmemdup(conn_attr->ssid,
> +						     conn_attr->ssid_len + 1,
>   						     GFP_KERNEL);
>   		if (!hif_drv->usr_conn_req.ssid) {
>   			result = -ENOMEM;
>   			goto error;
>   		}
> -		memcpy(hif_drv->usr_conn_req.ssid,
> -		       conn_attr->ssid,
> -		       conn_attr->ssid_len);
 >               hif_drv->usr_conn_req.ssid[conn_attr->ssid_len] = '\0';

I don't know if it is an issue, but now the memcpy is 1 more byte 
(conn_attr->ssid_len   vs   conn_attr->ssid_len + 1)

kmemdup_nul(conn_attr->ssid, conn_attr->ssid_len, GFP_KERNEL)
and remove hif_drv->usr_conn_req.ssid[conn_attr->ssid_len] = '\0'  ?

CJ

[...]

