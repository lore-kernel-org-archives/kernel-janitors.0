From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 22 May 2020 05:13:08 +0000
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
Message-Id: <CAMGffEmC215iOmtT_iZizey=jnbgWneE5f5zapYvdJi5WYDM1w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519120347.GD42765@mwanda> <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
In-Reply-To: <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, May 19, 2020 at 2:52 PM Jinpu Wang <jinpu.wang@cloud.ionos.com> wrote:
>
> On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The alloc_sess() function returns error pointers, it never returns NULL.
> >
> > Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thanks Dan,
> Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Hi Jason,

Could you also queue this fix for for-next?

Thanks
