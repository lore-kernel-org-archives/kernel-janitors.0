From: Chao Yu <chao@kernel.org>
Date: Sun, 25 Feb 2018 15:17:37 +0000
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant initialization of pointer 'p'
Message-Id: <d7d316b1-7e55-115c-0c45-f381ce774bee@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180221181340.7596-1-colin.king@canonical.com>
In-Reply-To: <20180221181340.7596-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2018/2/22 2:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer p is initialized with a value that is never read and is later
> re-assigned a new value, hence the initialization is redundant and can
> be removed.
> 
> Cleans up clang warning:
> fs/f2fs/extent_cache.c:463:19: warning: Value stored to 'p' during
> its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
