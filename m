From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 04 Nov 2017 20:26:40 +0000
Subject: Re: [PATCH] rtlwifi: remove redundant initialization to cfg_cmd
Message-Id: <9b9712ba-42fd-8683-2d65-e72187647902@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104193759.919-1-colin.king@canonical.com>
In-Reply-To: <20171104193759.919-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/04/2017 02:37 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> cfg_cmd is initialized to zero and this value is never read, instead
> it is over-written in the start of a do-while loop. Remove the
> redundant initialization. Cleans up clang warning:
> 
> drivers/net/wireless/realtek/rtlwifi/core.c:1750:22: warning: Value
> stored to 'cfg_cmd' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks OK to me.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

> ---
>   drivers/net/wireless/realtek/rtlwifi/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtlwifi/core.c b/drivers/net/wireless/realtek/rtlwifi/core.c
> index 1147327e6f52..7a17cc20c57e 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/core.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/core.c
> @@ -1748,7 +1748,7 @@ bool rtl_hal_pwrseqcmdparsing(struct rtl_priv *rtlpriv, u8 cut_version,
>   			      u8 faversion, u8 interface_type,
>   			      struct wlan_pwr_cfg pwrcfgcmd[])
>   {
> -	struct wlan_pwr_cfg cfg_cmd = {0};
> +	struct wlan_pwr_cfg cfg_cmd;
>   	bool polling_bit = false;
>   	u32 ary_idx = 0;
>   	u8 value = 0;
> 

