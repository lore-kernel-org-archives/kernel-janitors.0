From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Date: Wed, 10 Feb 2021 20:05:34 +0000
Subject: Re: [PATCH][next] io_uring: remove redundant initialization of variable ret
Message-Id: <BYAPR04MB4965CDA76126E201ACEA6BB6868D9@BYAPR04MB4965.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210200007.149248-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2/10/21 12:02, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Fixes: b63534c41e20 ("io_uring: re-issue block requests that failed because of resources")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
