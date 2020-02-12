From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 12 Feb 2020 16:03:18 +0000
Subject: Re: [PATCH net-next] rtw88: use kfree_skb() instead of kfree()
Message-Id: <20200212160318.A59BEC4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200203024801.177044-1-weiyongjun1@huawei.com>
In-Reply-To: <20200203024801.177044-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, Chin-Yen Lee <timlee@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Use kfree_skb() instead of kfree() to free sk_buff.
> 
> Fixes: b6c12908a33e ("rtw88: Add wowlan net-detect support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Dan already submitted identical patch:
https://patchwork.kernel.org/patch/11356627/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/patch/11361999/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
