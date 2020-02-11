From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 11 Feb 2020 16:07:11 +0000
Subject: Re: [PATCH][next] io_uring: fix return of an uninitialized variable ret
Message-Id: <e293c9a0-af86-d2f9-7ee7-c5ac41370887@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200211160259.90660-1-colin.king@canonical.com>
In-Reply-To: <20200211160259.90660-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/11/20 9:02 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently variable ret is not initialized and this value is being
> returned at the end of the function io_poll_double_wake.  Since
> ret is not being used anywhere else remove it and just return 0.

It's supposed to return 1, a previous edition had 'ret' dependent
on the wake call, but we didn't need that anymore.

I folded in a fix earlier this morning, and my for-next branch should
now be fine.

-- 
Jens Axboe
