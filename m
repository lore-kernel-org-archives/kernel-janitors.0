From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 07 Dec 2020 15:01:03 +0000
Subject: Re: [PATCH][next] block/rnbd: fix a null pointer dereference on dev->blk_symlink_name
Message-Id: <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207145446.169978-1-colin.king@canonical.com>
In-Reply-To: <20201207145446.169978-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/7/20 7:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the case where dev->blk_symlink_name fails to be allocates
> the error return path attempts to set an end-of-string character to
> the unallocated dev->blk_symlink_name causing a null pointer dereference
> error. Fix this by returning with an explicity ENOMEM error (which also
> is missing in the original code as was not initialized).

Applied, thanks.

-- 
Jens Axboe
