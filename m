From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 06 Sep 2019 14:10:53 +0000
Subject: Re: [PATCH] rtw88: fix seq_file memory leak
Message-Id: <20190906141053.0C1346115A@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904141601.186107-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141601.186107-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> When using single_open(), single_release() should be used instead
> of seq_release(), otherwise there is a memory leak.
> 
> This is detected by Coccinelle semantic patch.
> 
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

eb9affaeff70 rtw88: fix seq_file memory leak

-- 
https://patchwork.kernel.org/patch/11130355/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
