From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 02 Jul 2018 14:27:09 +0000
Subject: Re: [PATCH] loop: remove redundant pointer inode
Message-Id: <1ab10ca5-4d2e-d95c-d1aa-3b510b874d2e@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702074706.10586-1-colin.king@canonical.com>
In-Reply-To: <20180702074706.10586-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/2/18 1:47 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer inode is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'inode' set but not used [-Wunused-but-set-variable]

Applied for 4.19, thanks.

-- 
Jens Axboe

