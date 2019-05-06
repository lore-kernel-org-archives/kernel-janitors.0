From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 06 May 2019 16:21:47 +0000
Subject: Re: [PATCH] io_uring: fix shadowed variable ret return code being not checked
Message-Id: <5ccacedd-41d9-f33c-25de-ae16bcdb7b08@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505220122.5024-1-colin.king@canonical.com>
In-Reply-To: <20190505220122.5024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/5/19 4:01 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently variable ret is declared in a while-loop code block that
> shadows another variable ret. When an error occurs in the while-loop
> the error return in ret is not being set in the outer code block and
> so the error check on ret is always going to be checking on the wrong
> ret variable resulting in check that is always going to be true and
> a premature return occurs.
> 
> Fix this by removing the declaration of the inner while-loop variable
> ret so that shadowing does not occur.

Thanks, applied.

-- 
Jens Axboe
