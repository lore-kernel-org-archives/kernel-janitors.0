From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 07 Dec 2020 15:02:34 +0000
Subject: Re: [PATCH][next] block/rnbd: fix a null pointer dereference on dev->blk_symlink_name
Message-Id: <CAMGffEmKW=wa3_UiJA9+SLKcB0q9WmOMThQwoe0pc9oQQ62phA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207145446.169978-1-colin.king@canonical.com> <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
In-Reply-To: <afd6edda-460c-8488-6e63-438053e88eac@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Colin King <colin.king@canonical.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-block <linux-block@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Mon, Dec 7, 2020 at 4:01 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/7/20 7:54 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently in the case where dev->blk_symlink_name fails to be allocates
> > the error return path attempts to set an end-of-string character to
> > the unallocated dev->blk_symlink_name causing a null pointer dereference
> > error. Fix this by returning with an explicity ENOMEM error (which also
> > is missing in the original code as was not initialized).
>
> Applied, thanks.

Thanks Colin for the fix, and thanks Jens for taking care of this.

Jack Wang
