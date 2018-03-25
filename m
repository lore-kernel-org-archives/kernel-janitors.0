From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 25 Mar 2018 11:38:37 +0000
Subject: Re: [PATCH][next][V2] staging: r8822be: fix typos in header guard macros
Message-Id: <20180325113837.GA28090@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323180018.21737-1-colin.king@canonical.com>
In-Reply-To: <20180323180018.21737-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

On Fri, Mar 23, 2018 at 06:00:18PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The macros for __PHYDMKFREE_H__ and __PHYDM_FEATURES_H__ contain
> typos and don't match the #if guard check. Defined them correctly.
> 
> Cleans up clang warnings:
> warning: '__PHYDMKFREE_H__' is used as a header guard here, followed
> by #define of a different macro [-Wheader-guard]
> warning: '__PHYDM_FEATURES_H__' is used as a header guard here, followed
> by #define of a different macro [-Wheader-guard]
> 
> Fixes: 9ce99b04b5b8 ("staging: r8822be: Add phydm mini driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtlwifi/phydm/phydm_features.h | 2 +-
>  drivers/staging/rtlwifi/phydm/phydm_kfree.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtlwifi/phydm/phydm_features.h b/drivers/staging/rtlwifi/phydm/phydm_features.h
> index 37f6f0cd7235..a12361c6a1a0 100644
> --- a/drivers/staging/rtlwifi/phydm/phydm_features.h
> +++ b/drivers/staging/rtlwifi/phydm/phydm_features.h
> @@ -24,7 +24,7 @@
>   *****************************************************************************/
>  
>  #ifndef __PHYDM_FEATURES_H__
> -#define __PHYDM_FEATURES
> +#define __PHYDM_FEATURES_H__
>  
>  /*phydm debyg report & tools*/
>  
> diff --git a/drivers/staging/rtlwifi/phydm/phydm_kfree.h b/drivers/staging/rtlwifi/phydm/phydm_kfree.h
> index 1ee60059afc1..2c6b0a48e76e 100644
> --- a/drivers/staging/rtlwifi/phydm/phydm_kfree.h
> +++ b/drivers/staging/rtlwifi/phydm/phydm_kfree.h
> @@ -24,7 +24,7 @@
>   *****************************************************************************/
>  
>  #ifndef __PHYDMKFREE_H__
> -#define __PHYDKFREE_H__
> +#define __PHYDKKFREE_H__

Close, but not quite :(

