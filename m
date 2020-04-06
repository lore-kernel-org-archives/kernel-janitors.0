From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Date: Mon, 06 Apr 2020 22:59:18 +0000
Subject: Re: [PATCH] io_uring: remove redundant variable pointer nxt and io_wq_assign_next call
Message-Id: <BYAPR04MB4965E6F6CCDA94AAD2EA1DDB86C20@BYAPR04MB4965.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406225439.654486-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 04/06/2020 03:54 PM, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
>
> An earlier commit "io_uring: remove @nxt from handlers" removed the
> setting of pointer nxt and now it is always null, hence the non-null
> check and call to io_wq_assign_next is redundant and can be removed.
>
> Addresses-Coverity: ("'Constant' variable guard")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
