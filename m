From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Oct 2019 13:17:35 +0000
Subject: Re: [PATCH] libertas: remove redundant assignment to variable ret
Message-Id: <20191002131734.GN22609@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002101517.10836-1-colin.king@canonical.com>
In-Reply-To: <20191002101517.10836-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Lubomir Rintel <lkundrak@v3.sk>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Added Lubomir Rintel to the CC list.

On Wed, Oct 02, 2019 at 11:15:17AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned a value that is never read and is
> being re-assigned a little later on. The assignment is redundant and hence
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/marvell/libertas/mesh.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/marvell/libertas/mesh.c b/drivers/net/wireless/marvell/libertas/mesh.c
> index 2747c957d18c..44c8a550da4c 100644
> --- a/drivers/net/wireless/marvell/libertas/mesh.c
> +++ b/drivers/net/wireless/marvell/libertas/mesh.c
> @@ -1003,7 +1003,6 @@ static int lbs_add_mesh(struct lbs_private *priv)
>  	if (priv->mesh_tlv) {
>  		sprintf(mesh_wdev->ssid, "mesh");
>  		mesh_wdev->mesh_id_up_len = 4;
> -		ret = 1;
>  	}

Removing this is fine.  "ret = 1" is a mistake.

This was copy and pasted in commit 2199c9817670 ("libertas: use
mesh_wdev->ssid instead of priv->mesh_ssid").  The return value was
never used so it's not clear what returning 1 vs 0 was supposed to mean.

lbs_init_mesh() should just be a void function.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
