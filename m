From: Chao Yu <yuchao0@huawei.com>
Date: Fri, 04 Jan 2019 02:37:23 +0000
Subject: Re: [PATCH -next] f2fs: remove set but not used variable 'err'
Message-Id: <e879debb-e000-3f97-9b99-e7e84d167903@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546565909-17400-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1546565909-17400-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019/1/4 9:38, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/f2fs/data.c: In function 'f2fs_dio_submit_bio':
> fs/f2fs/data.c:2585:6: warning:
>  variable 'err' set but not used [-Wunused-but-set-variable]
> 
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
