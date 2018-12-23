From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Sun, 23 Dec 2018 11:28:23 +0000
Subject: Re: [PATCH net-next] cw1200: fix missing unlock on error in cw1200_hw_scan()
Message-Id: <1a97f5e6-aacd-f937-f222-793764c93564@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545474894-124328-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545474894-124328-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Solomon Peachy <pizza@shaftnet.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Oh, I forgot to handle the error case in my previous commit 4f68ef64cd7f...
Thanks for this patch :)

On 2018/12/22 18:34, Wei Yongjun wrote:
> Add the missing unlock before return from function cw1200_hw_scan()
> in the error handling case.
>
> Fixes: 4f68ef64cd7f ("cw1200: Fix concurrency use-after-free bugs in cw1200_hw_scan()")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/net/wireless/st/cw1200/scan.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/st/cw1200/scan.c b/drivers/net/wireless/st/cw1200/scan.c
> index 0a9eac9..71e9b91 100644
> --- a/drivers/net/wireless/st/cw1200/scan.c
> +++ b/drivers/net/wireless/st/cw1200/scan.c
> @@ -84,8 +84,11 @@ int cw1200_hw_scan(struct ieee80211_hw *hw,
>   
>   	frame.skb = ieee80211_probereq_get(hw, priv->vif->addr, NULL, 0,
>   		req->ie_len);
> -	if (!frame.skb)
> +	if (!frame.skb) {
> +		mutex_unlock(&priv->conf_mutex);
> +		up(&priv->scan.lock);
>   		return -ENOMEM;
> +	}
>   
>   	if (req->ie_len)
>   		skb_put_data(frame.skb, req->ie, req->ie_len);
>
>
>

Acked-by: Jia-Ju Bai <baijiaju1990@gmail.com>
