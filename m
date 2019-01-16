From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 16 Jan 2019 12:24:48 +0000
Subject: Re: [PATCH] mac80211-next: remove duplicated include from virt_wifi.c
Message-Id: <cfdac00b-ea9a-1805-4668-64e44c523f6d@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545274285-143886-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545274285-143886-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

ping...

On 2018/12/20 10:51, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/wireless/virt_wifi.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/virt_wifi.c b/drivers/net/wireless/virt_wifi.c
> index 64b2186..245d4d0 100644
> --- a/drivers/net/wireless/virt_wifi.c
> +++ b/drivers/net/wireless/virt_wifi.c
> @@ -14,11 +14,6 @@
>  #include <linux/etherdevice.h>
>  #include <linux/module.h>
>  
> -#include <net/cfg80211.h>
> -#include <net/rtnetlink.h>
> -#include <linux/etherdevice.h>
> -#include <linux/module.h>
> -
>  static struct wiphy *common_wiphy;
>  
>  struct virt_wifi_wiphy_priv {
> 
> 
> 
> 
> .
> 
