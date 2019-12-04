From: Minchan Kim <minchan@kernel.org>
Date: Wed, 04 Dec 2019 01:16:28 +0000
Subject: Re: [PATCH] zram: fix error return codes not being returned in writeback_store
Message-Id: <20191204011628.GA6629@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191128122958.178290-1-colin.king@canonical.com>
In-Reply-To: <20191128122958.178290-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org

On Thu, Nov 28, 2019 at 12:29:58PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an error code -EIO or -ENOSPC in the for-loop of
> writeback_store the error code is being overwritten by a ret = len
> assignment at the end of the function and the error codes are being
> lost.  Fix this by assigning ret = len at the start of the function
> and remove the assignment from the end, hence allowing ret to be
> preserved when error codes are assigned to it.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: a939888ec38b ("zram: support idle/huge page writeback")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Minchan Kim <minchan@kernel.org>

Thanks!
