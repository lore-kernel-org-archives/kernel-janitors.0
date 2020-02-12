From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 12 Feb 2020 16:20:20 +0000
Subject: Re: [PATCH] rtw88: Use kfree_skb() instead of kfree()
Message-Id: <20200212162020.00ACAC4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200129173923.rfufhv5c5pxwodm6@kili.mountain>
In-Reply-To: <20200129173923.rfufhv5c5pxwodm6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, Chin-Yen Lee <timlee@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> sk_buff structs need to be freed with kfree_skb(), not kfree().
> 
> Fixes: b6c12908a33e ("rtw88: Add wowlan net-detect support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

bafbc6f0b51b rtw88: Use kfree_skb() instead of kfree()

-- 
https://patchwork.kernel.org/patch/11356627/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
