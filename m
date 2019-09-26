From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 26 Sep 2019 09:56:30 +0000
Subject: Re: [PATCH][next] io_uring: ensure variable ret is initialized to zero
Message-Id: <3aa821ea-3041-fb56-2458-ec643963c511@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926095012.31826-1-colin.king@canonical.com>
In-Reply-To: <20190926095012.31826-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/26/19 11:50 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where sig is NULL the error variable ret is not initialized
> and may contain a garbage value on the final checks to see if ret is
> -ERESTARTSYS.  Best to initialize ret to zero before the do loop to
> ensure the ret does not accidentially contain -ERESTARTSYS before the
> loop.

Oops, weird it didn't complain. I've folded in this fix, as that commit
isn't upstream yet. Thanks!

-- 
Jens Axboe
