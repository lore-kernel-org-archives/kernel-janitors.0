From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 17 Nov 2017 15:54:01 +0000
Subject: Re: [PATCH] staging: rtl8822be: fix missing null check on dev_alloc_skb return
Message-Id: <9787e83a-1b4a-cd80-4f2d-bfbe031056db@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171117145055.30430-1-colin.king@canonical.com>
In-Reply-To: <20171117145055.30430-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/17/2017 08:50 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> dev_alloc_skb can potentially return NULL, so add a null check to
> avoid a null pointer dereference on skb

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

> 
> Detected by CoverityScan, CID#1454558 ("Dereference on null return")
> 
> Fixes: 7e5b796cde7e ("staging: r8822be: Add the driver code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/rtlwifi/rtl8822be/fw.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/rtlwifi/rtl8822be/fw.c b/drivers/staging/rtlwifi/rtl8822be/fw.c
> index f45487122517..483ea85943c3 100644
> --- a/drivers/staging/rtlwifi/rtl8822be/fw.c
> +++ b/drivers/staging/rtlwifi/rtl8822be/fw.c
> @@ -464,6 +464,8 @@ bool rtl8822b_halmac_cb_write_data_rsvd_page(struct rtl_priv *rtlpriv, u8 *buf,
>   	int count;
>   
>   	skb = dev_alloc_skb(size);
> +	if (!skb)
> +		return false;
>   	memcpy((u8 *)skb_put(skb, size), buf, size);
>   
>   	if (!_rtl8822be_send_bcn_or_cmd_packet(rtlpriv->hw, skb, BEACON_QUEUE))
> 

