From: Jens Axboe <axboe@fb.com>
Date: Tue, 03 Nov 2015 19:58:33 +0000
Subject: Re: [patch] NVMe: Precedence error in nvme_pr_clear()
Message-Id: <563911E9.6080605@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103195049.GA17238@mwanda>
In-Reply-To: <20151103195049.GA17238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/03/2015 12:50 PM, Dan Carpenter wrote:
> The original code is equivalent to:
>
> 	u32 cdw10 = (1 | key) ? 1 << 3 : 0;
>
> But we want:
>
> 	u32 cdw10 = 1 | (key ? 1 << 3 : 0);
>
> Fixes: 1d277a637a71: ('NVMe: Add persistent reservation ops')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, applied.


-- 
Jens Axboe

