From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 10 Jan 2019 11:34:46 +0000
Subject: Re: [PATCH net-next] cw1200: fix missing unlock on error in cw1200_hw_scan()
Message-Id: <20190110113446.99CA960386@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545474894-124328-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545474894-124328-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Solomon Peachy <pizza@shaftnet.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Add the missing unlock before return from function cw1200_hw_scan()
> in the error handling case.
> 
> Fixes: 4f68ef64cd7f ("cw1200: Fix concurrency use-after-free bugs in cw1200_hw_scan()")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Jia-Ju Bai <baijiaju1990@gmail.com>

cw1200 patches go to wireless-drivers-next, not net-next. In the future please
don't mark them for net-next to avoid any confusion.

-- 
https://patchwork.kernel.org/patch/10741431/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
