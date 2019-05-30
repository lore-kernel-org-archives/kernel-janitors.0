From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Thu, 30 May 2019 18:50:01 +0000
Subject: Re: [PATCH] rtlwifi: remove redundant assignment to variable badworden
Message-Id: <da50d69f-0117-3911-e15f-cf7731300886@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530184044.8479-1-colin.king@canonical.com>
In-Reply-To: <20190530184044.8479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/30/19 1:40 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable badworden is assigned with a value that is never read and
> it is re-assigned a new value immediately afterwards.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

>   drivers/net/wireless/realtek/rtlwifi/efuse.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtlwifi/efuse.c b/drivers/net/wireless/realtek/rtlwifi/efuse.c
> index e68340dfd980..37ab582a8afb 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/efuse.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/efuse.c
> @@ -986,7 +986,6 @@ static int efuse_pg_packet_write(struct ieee80211_hw *hw,
>   		} else if (write_state = PG_STATE_DATA) {
>   			RTPRINT(rtlpriv, FEEPROM, EFUSE_PG,
>   				"efuse PG_STATE_DATA\n");
> -			badworden = 0x0f;
>   			badworden >   			    enable_efuse_data_write(hw, efuse_addr + 1,
>   						    target_pkt.word_en,
> 
