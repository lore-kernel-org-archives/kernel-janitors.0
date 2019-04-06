From: Mukesh Ojha <mojha@codeaurora.org>
Date: Sat, 06 Apr 2019 08:31:37 +0000
Subject: Re: [PATCH -next] staging: rtlwifi: rtl8822be: Remove set but not used variable 'curtxbw_40mhz'
Message-Id: <44fa9b63-699f-0203-2447-c8217cfbb803@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190406031118.59321-1-yuehaibing@huawei.com>
In-Reply-To: <20190406031118.59321-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ping-Ke Shih <pkshih@realtek.com>, Nathan Chancellor <natechancellor@gmail.com>, Nishka Dasgupta <nishka.dasgupta@yahoo.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 4/6/2019 8:41 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/staging/rtlwifi/rtl8822be/hw.c: In function 'rtl8822be_update_hal_rate_mask':
> drivers/staging/rtlwifi/rtl8822be/hw.c:2144:5: warning:
>   variable 'curtxbw_40mhz' set but not used [-Wunused-but-set-variable]
>
> It's never used and can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/staging/rtlwifi/rtl8822be/hw.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/rtlwifi/rtl8822be/hw.c b/drivers/staging/rtlwifi/rtl8822be/hw.c
> index dac22c21f821..1de4e903a4de 100644
> --- a/drivers/staging/rtlwifi/rtl8822be/hw.c
> +++ b/drivers/staging/rtlwifi/rtl8822be/hw.c
> @@ -2141,8 +2141,6 @@ static void rtl8822be_update_hal_rate_mask(struct ieee80211_hw *hw,
>   	u32 ratr_bitmap, ratr_bitmap_msb = 0;
>   	u8 ratr_index;
>   	enum wireless_mode wirelessmode = 0;
> -	u8 curtxbw_40mhz > -		(sta->ht_cap.cap & IEEE80211_HT_CAP_SUP_WIDTH_20_40) ? 1 : 0;
>   	bool b_shortgi = false;
>   	u8 rate_mask[7];
>   	u8 macid = 0;
> @@ -2153,11 +2151,8 @@ static void rtl8822be_update_hal_rate_mask(struct ieee80211_hw *hw,
>   
>   	RT_TRACE(rtlpriv, COMP_RATR, DBG_LOUD, "wireless mode = 0x%x\n",
>   		 wirelessmode);
> -	if (mac->opmode = NL80211_IFTYPE_STATION ||
> -	    mac->opmode = NL80211_IFTYPE_MESH_POINT) {
> -		curtxbw_40mhz = mac->bw_40;
> -	} else if (mac->opmode = NL80211_IFTYPE_AP ||
> -		   mac->opmode = NL80211_IFTYPE_ADHOC)
> +	if (mac->opmode = NL80211_IFTYPE_AP ||
> +	    mac->opmode = NL80211_IFTYPE_ADHOC)
>   		macid = sta->aid + 1;
>   	if (wirelessmode = WIRELESS_MODE_N_5G ||
>   	    wirelessmode = WIRELESS_MODE_AC_5G ||
>
>
>
>
>
