From: walter harms <wharms@bfs.de>
Date: Fri, 17 Mar 2017 08:35:47 +0000
Subject: Re: [PATCH] staging: wilc1000: fix incorrect copy of pmkid data
Message-Id: <58CB9FE3.9010708@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316232145.7704-1-colin.king@canonical.com>
In-Reply-To: <20170316232145.7704-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 17.03.2017 00:21, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pmkid data is meant be be copied to the previous item in the
> pmkidlist, however the code is just copying the data to itself because
> the src index into pmkidlist is the same as the dst index into pmkidlist.
> Fix this with i + 1 instead of i.
> 
> Detected by CoverityScan,CID#13339465 ("Overlapping buffer in memory copy")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/wilc1000/wilc_wfi_cfgoperations.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> index a37896f..4034f40 100644
> --- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> +++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> @@ -1346,7 +1346,7 @@ static int del_pmksa(struct wiphy *wiphy, struct net_device *netdev,
>  			       priv->pmkid_list.pmkidlist[i + 1].bssid,
>  			       ETH_ALEN);
>  			memcpy(priv->pmkid_list.pmkidlist[i].pmkid,
> -			       priv->pmkid_list.pmkidlist[i].pmkid,
> +			       priv->pmkid_list.pmkidlist[i + 1].pmkid,
>  			       PMKID_LEN);
>  		}
>  		priv->pmkid_list.numpmkid--;



perhaps we can also simplify the error handling:
that would reduce the indentlevel by one and effectivly remove the s32Error variable.

if (i >= priv->pmkid_list.numpmkid || priv->pmkid_list.numpmkid <= 0)
	return -EINVAL;


just my 2 cents.
re,
 wh

