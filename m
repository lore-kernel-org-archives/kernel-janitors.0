From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 20 Dec 2019 23:48:48 +0000
Subject: Re: [PATCH][next] io_uring: fix missing error return when percpu_ref_init fails
Message-Id: <398f514a-e2ce-8b4f-16cf-4edeec5fa1e7@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191220233322.13599-1-colin.king@canonical.com>
In-Reply-To: <20191220233322.13599-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/20/19 4:33 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to percpu_ref_init fails ctx->file_data is
> set to null and because there is a missing return statement the
> following statement dereferences this null pointer causing an oops.
> Fix this by adding the missing -ENOMEM return to avoid the oops.

Nice, thanks! I'm guessing I didn't have the necessary magic debug
options to allow failure injection for failing.


-- 
Jens Axboe
