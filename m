From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 06 Apr 2020 23:33:53 +0000
Subject: Re: [PATCH] io_uring: remove redundant variable pointer nxt and io_wq_assign_next call
Message-Id: <434016cd-bf33-ce65-a86b-69a565d62a61@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406225439.654486-1-colin.king@canonical.com>
In-Reply-To: <20200406225439.654486-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/6/20 3:54 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit "io_uring: remove @nxt from handlers" removed the
> setting of pointer nxt and now it is always null, hence the non-null
> check and call to io_wq_assign_next is redundant and can be removed.

Thanks, applied.

-- 
Jens Axboe
