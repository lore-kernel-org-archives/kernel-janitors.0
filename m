From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 06 Oct 2008 01:20:49 +0000
Subject: Re: [PATCH 1/2] drivers/i2c/busses/i2c-s3c2410.c: Correct use of.and &
Message-Id: <919fe2b30810051820w29df40d0ued4e15d740674a29@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0810042203520.19286@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0810042203520.19286@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: ben-linux@fluff.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Oct 4, 2008 at 4:05 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
> involved converting !x & y to !(x & y).  The code below shows the same
> pattern, and thus should perhaps be fixed in the same way.  In particular,
> the result of !readl(i2c->regs + S3C2410_IICCON) & S3C2410_IICCON_IRQEN is
> always 0.
>
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @@ expression E; constant C; @@
> (
>  !E & !C
> |
> - !E & C
> + !(E & C)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
Reviewed-by: Mark Asselstine <mark.asselstine@windriver.com>

Good catch Julia.


>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -507,7 +507,7 @@ static int s3c24xx_i2c_doxfer(struct s3c
>        unsigned long timeout;
>        int ret;
>
> -       if (!readl(i2c->regs + S3C2410_IICCON) & S3C2410_IICCON_IRQEN)
> +       if (!(readl(i2c->regs + S3C2410_IICCON) & S3C2410_IICCON_IRQEN))
>                return -EIO;
>
>        ret = s3c24xx_i2c_set_master(i2c);
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
