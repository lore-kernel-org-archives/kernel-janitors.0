From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 14 Apr 2017 12:15:32 +0000
Subject: Re: [PATCH] staging: rtl8723bs: clean up identical code on an if statement
Message-Id: <560665f3-45cb-0d34-aac1-04f3fe6d4b59@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413154636.11713-1-colin.king@canonical.com>
In-Reply-To: <20170413154636.11713-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 13-04-17 17:46, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The two different paths for an if statement are identical and hence
> we can just replace it with the single statement.
>
> Detected by CoverityScan, CID#1428443 ("Identical code for
> different branches")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 53755e5b97a6..9e355734f0c0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1093,11 +1093,7 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
>  		rtw_init_bcmc_stainfo(adapter);
>  	}
>
> -	if (lock_scanned_queue) {
> -		find_network(adapter);
> -	} else {
> -		find_network(adapter);
> -	}
> +	find_network(adapter);
>
>  	if (lock_scanned_queue)
>  		adapter->securitypriv.key_mask = 0;
>
