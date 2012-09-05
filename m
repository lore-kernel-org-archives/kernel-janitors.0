From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 05 Sep 2012 19:46:20 +0000
Subject: Re: [PATCH 4/5] drivers/media/platform/vino.c: fix error return code
Message-Id: <CALF0-+UiJy-mcB7U003dCqmQp2ziiTKrTehh3E-2C6FU2bfvkQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346775269-12191-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346775269-12191-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Peter,

On Tue, Sep 4, 2012 at 1:14 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
>
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>  drivers/media/platform/vino.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/vino.c b/drivers/media/platform/vino.c
> index cc9110c..6654a28 100644
> --- a/drivers/media/platform/vino.c
> +++ b/drivers/media/platform/vino.c
> @@ -2061,6 +2061,7 @@ static int vino_capture_next(struct vino_channel_settings *vcs, int start)
>         }
>         if (incoming = 0) {
>                 dprintk("vino_capture_next(): no buffers available\n");
> +               err = -ENOMEM;
>                 goto out;
>         }
>

Mmm, this one doesn't look good.

I think the intention was to return zero, without error.
They driver tt's just double-checking for incoming data, if there's no incoming
data, then he simply exits.

Thanks,
Ezequiel.
