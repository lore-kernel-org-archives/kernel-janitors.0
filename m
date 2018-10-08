From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 08 Oct 2018 15:53:41 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: replace _rtl8821ae_mrate_idx_to_arfr_id with generic version
Message-Id: <aac8eec4-d4e7-93c3-d42c-8960d16629d6@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008085028.23874-1-colin.king@canonical.com>
In-Reply-To: <20181008085028.23874-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/8/18 3:50 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function _rtl8821ae_mrate_idx_to_arfr_id is functionally identical to
> the generic version rtl_mrate_idx_to_arfr_id, so remove
> _rtl8821ae_mrate_idx_to_arfr_id and use the generic one instead.
> 
> This also fixes a missing break statement found by CoverityScan in
> _rtl8821ae_mrate_idx_to_arfr_id, namely: CID#1167237 ("Missing break
> in switch")
> 
> Thanks to Joe Perches for spotting this when I submitted an earlier patch.
> 
> Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   .../wireless/realtek/rtlwifi/rtl8821ae/hw.c   | 71 +------------------
>   1 file changed, 1 insertion(+), 70 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
> index 317c1b3101da..ba258318ee9f 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
> @@ -3404,75 +3404,6 @@ static void rtl8821ae_update_hal_rate_table(struct ieee80211_hw *hw,
>   		 "%x\n", rtl_read_dword(rtlpriv, REG_ARFR0));
>   }
>   
> -static u8 _rtl8821ae_mrate_idx_to_arfr_id(
> -	struct ieee80211_hw *hw, u8 rate_index,
> -	enum wireless_mode wirelessmode)
> -{
> -	struct rtl_priv *rtlpriv = rtl_priv(hw);
> -	struct rtl_phy *rtlphy = &rtlpriv->phy;
> -	u8 ret = 0;
> -	switch (rate_index) {
> -	case RATR_INX_WIRELESS_NGB:
> -		if (rtlphy->rf_type = RF_1T1R)
> -			ret = 1;
> -		else
> -			ret = 0;
> -		; break;
> -	case RATR_INX_WIRELESS_N:
> -	case RATR_INX_WIRELESS_NG:
> -		if (rtlphy->rf_type = RF_1T1R)
> -			ret = 5;
> -		else
> -			ret = 4;
> -		; break;
> -	case RATR_INX_WIRELESS_NB:
> -		if (rtlphy->rf_type = RF_1T1R)
> -			ret = 3;
> -		else
> -			ret = 2;
> -		; break;
> -	case RATR_INX_WIRELESS_GB:
> -		ret = 6;
> -		break;
> -	case RATR_INX_WIRELESS_G:
> -		ret = 7;
> -		break;
> -	case RATR_INX_WIRELESS_B:
> -		ret = 8;
> -		break;
> -	case RATR_INX_WIRELESS_MC:
> -		if ((wirelessmode = WIRELESS_MODE_B)
> -			|| (wirelessmode = WIRELESS_MODE_G)
> -			|| (wirelessmode = WIRELESS_MODE_N_24G)
> -			|| (wirelessmode = WIRELESS_MODE_AC_24G))
> -			ret = 6;
> -		else
> -			ret = 7;
> -	case RATR_INX_WIRELESS_AC_5N:
> -		if (rtlphy->rf_type = RF_1T1R)
> -			ret = 10;
> -		else
> -			ret = 9;
> -		break;
> -	case RATR_INX_WIRELESS_AC_24N:
> -		if (rtlphy->current_chan_bw = HT_CHANNEL_WIDTH_80) {
> -			if (rtlphy->rf_type = RF_1T1R)
> -				ret = 10;
> -			else
> -				ret = 9;
> -		} else {
> -			if (rtlphy->rf_type = RF_1T1R)
> -				ret = 11;
> -			else
> -				ret = 12;
> -		}
> -		break;
> -	default:
> -		ret = 0; break;
> -	}
> -	return ret;
> -}
> -
>   static u32 _rtl8821ae_rate_to_bitmap_2ssvht(__le16 vht_rate)
>   {
>   	u8 i, j, tmp_rate;
> @@ -3761,7 +3692,7 @@ static void rtl8821ae_update_hal_rate_mask(struct ieee80211_hw *hw,
>   		break;
>   	}
>   
> -	ratr_index = _rtl8821ae_mrate_idx_to_arfr_id(hw, ratr_index, wirelessmode);
> +	ratr_index = rtl_mrate_idx_to_arfr_id(hw, ratr_index, wirelessmode);
>   	sta_entry->ratr_index = ratr_index;
>   	ratr_bitmap = _rtl8821ae_set_ra_vht_ratr_bitmap(hw, wirelessmode,
>   							ratr_bitmap);
> 

ACKed-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
