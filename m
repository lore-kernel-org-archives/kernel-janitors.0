From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 31 May 2019 17:29:12 +0000
Subject: Re: [PATCH] rtlwifi: remove redundant assignment to variable k
Message-Id: <14372bed-6522-d81c-7d68-04adc0d71193@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531141412.18632-1-colin.king@canonical.com>
In-Reply-To: <20190531141412.18632-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/31/19 9:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of 0 to variable k is never read once we break out of
> the loop, so the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/wireless/realtek/rtlwifi/efuse.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtlwifi/efuse.c b/drivers/net/wireless/realtek/rtlwifi/efuse.c
> index e68340dfd980..83e5318ca04f 100644
> --- a/drivers/net/wireless/realtek/rtlwifi/efuse.c
> +++ b/drivers/net/wireless/realtek/rtlwifi/efuse.c
> @@ -117,10 +117,8 @@ u8 efuse_read_1byte(struct ieee80211_hw *hw, u16 address)
>   						 rtlpriv->cfg->
>   						 maps[EFUSE_CTRL] + 3);
>   			k++;
> -			if (k = 1000) {
> -				k = 0;
> +			if (k = 1000)
>   				break;
> -			}
>   		}
>   		data = rtl_read_byte(rtlpriv, rtlpriv->cfg->maps[EFUSE_CTRL]);
>   		return data;

Colin,

Your patch is not wrong, but it fails to address a basic deficiency of this code 
snippet - when an error is detected, there is no attempt to either fix the 
problem or report it upstream. As the data returned will be garbage if this 
condition happens, we might as well replace the "break" with "return 0xFF", as 
well as deleting the "k = 0" line. Most of the callers of efuse_read_1byte() 
ignore the returned result when bits 0 and 4 are set, thus returning all 8 bits 
is not a bad fixup.

My suspicion is that this test is in the code merely to prevent an potential 
unterminated "while" loop, and that this condition is extremely unlikely to happen.

Larry
