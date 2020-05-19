From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Tue, 19 May 2020 12:52:05 +0000
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
Message-Id: <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519120347.GD42765@mwanda>
In-Reply-To: <20200519120347.GD42765@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The alloc_sess() function returns error pointers, it never returns NULL.
>
> Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks Dan,
Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>

> ---
>  drivers/block/rnbd/rnbd-clt.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index 55bff3b1be71..a033247281da 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -923,13 +923,12 @@ rnbd_clt_session *find_or_create_sess(const char *sessname, bool *first)
>         sess = __find_and_get_sess(sessname);
>         if (!sess) {
>                 sess = alloc_sess(sessname);
> -               if (sess) {
> -                       list_add(&sess->list, &sess_list);
> -                       *first = true;
> -               } else {
> +               if (IS_ERR(sess)) {
>                         mutex_unlock(&sess_lock);
> -                       return ERR_PTR(-ENOMEM);
> +                       return sess;
>                 }
> +               list_add(&sess->list, &sess_list);
> +               *first = true;
>         } else
>                 *first = false;
>         mutex_unlock(&sess_lock);
> --
> 2.26.2
>
