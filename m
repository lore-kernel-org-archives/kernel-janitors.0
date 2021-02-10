From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 10 Feb 2021 20:30:22 +0000
Subject: Re: [PATCH][next] io_uring: remove redundant initialization of variable ret
Message-Id: <7cbce70d-741e-2948-d1c4-9f30a89d029d@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210200007.149248-1-colin.king@canonical.com>
In-Reply-To: <20210210200007.149248-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/10/21 1:00 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe
