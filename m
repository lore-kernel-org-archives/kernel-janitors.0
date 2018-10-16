From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 16 Oct 2018 02:03:29 +0000
Subject: Re: [PATCH -next] null_blk: remove set but not used variable 'q'
Message-Id: <ad638446-2ce6-34f4-ed7a-a3cafaabc2b4@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539654326-165410-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539654326-165410-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/15/18 7:45 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/block/null_blk_main.c: In function 'end_cmd':
> drivers/block/null_blk_main.c:609:24: warning:
>  variable 'q' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after commit
> e50b1e327aeb ("null_blk: remove legacy IO path")

Thanks, applied.

-- 
Jens Axboe
