From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 18 May 2020 12:15:43 +0000
Subject: Re: [PATCH] rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()
Message-Id: <20200518121543.E2B76C43637@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513093951.GD347693@mwanda>
In-Reply-To: <20200513093951.GD347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Seven years ago we tried to fix a leak but actually introduced a double
> free instead.  It was an understandable mistake because the code was a
> bit confusing and the free was done in the wrong place.  The "skb"
> pointer is freed in both _rtl_usb_tx_urb_setup() and _rtl_usb_transmit().
> The free belongs _rtl_usb_transmit() instead of _rtl_usb_tx_urb_setup()
> and I've cleaned the code up a bit to hopefully make it more clear.
> 
> Fixes: 36ef0b473fbf ("rtlwifi: usb: add missing freeing of skbuff")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

beb12813bc75 rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()

-- 
https://patchwork.kernel.org/patch/11545535/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
