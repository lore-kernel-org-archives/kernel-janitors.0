From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 02 Jul 2018 14:27:00 +0000
Subject: Re: [PATCH] block/floppy: remove redundant variable dflags
Message-Id: <def4a200-a68a-3290-73d5-bd1c98626283@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702074234.10435-1-colin.king@canonical.com>
In-Reply-To: <20180702074234.10435-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jiri Kosina <jikos@kernel.org>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/2/18 1:42 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable dflags is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'dflags' set but not used [-Wunused-but-set-variable]

Applied for 4.19, thanks.

-- 
Jens Axboe

