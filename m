From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 19 Apr 2017 13:58:07 +0000
Subject: Re: ath9k: off by one in ath9k_hw_nvram_read_array()
Message-Id: <939efb73b7f14d82ac204871395d3b4b@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170406051220.GA23650@mwanda>
In-Reply-To: <20170406051220.GA23650@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Gabor Juhos <juhosg@openwrt.org>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The > should be >= or we read one space beyond the end of the array.
> 
> Fixes: ab5c4f71d8c7 ("ath9k: allow to load EEPROM content via firmware API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/ath/ath9k/eeprom.c b/drivers/net/wireless/ath/ath9k/eeprom.c
> index fb80ec86e53d..6ccf24814514 100644
> --- a/drivers/net/wireless/ath/ath9k/eeprom.c
> +++ b/drivers/net/wireless/ath/ath9k/eeprom.c
> @@ -112,7 +112,7 @@ void ath9k_hw_usb_gen_fill_eeprom(struct ath_hw *ah, u16 *eep_data,
>  static bool ath9k_hw_nvram_read_array(u16 *blob, size_t blob_size,
>  				      off_t offset, u16 *data)
>  {
> -	if (offset > blob_size)
> +	if (offset >= blob_size)
>  		return false;
>  
>  	*data =  blob[offset];

Patch applied to ath-next branch of ath.git, thanks.

b7dcf68f383a ath9k: off by one in ath9k_hw_nvram_read_array()

-- 
https://patchwork.kernel.org/patch/9666031/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

