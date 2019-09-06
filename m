From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 06 Sep 2019 14:11:53 +0000
Subject: Re: [PATCH] rtlwifi: Fix file release memory leak
Message-Id: <20190906141153.CF5606118D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904141611.4780-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141611.4780-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> This is detected by Coccinelle semantic patch.
> 
> Fixes: 610247f46feb ("rtlwifi: Improve debugging by using debugfs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

4c3e48794dec rtlwifi: Fix file release memory leak

-- 
https://patchwork.kernel.org/patch/11130357/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
