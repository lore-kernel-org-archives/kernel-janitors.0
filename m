From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 06 May 2020 10:38:22 +0000
Subject: Re: [PATCH] iio: sca3000: Remove an erroneous 'get_device()'
Message-Id: <CAHp75Vdi+ZYpQPHgoREQ6LTaUHTPmNkR7ULZaVNTJr7Bvh-q9Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506035206.192173-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200506035206.192173-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, linux-iio <linux-iio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 6, 2020 at 6:55 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This looks really unusual to have a 'get_device()' hidden in a 'dev_err()'
> call.
> Remove it.
>
> While at it add a missing \n at the end of the message.
>

It should have Fixes tag because it is a quite an issue (get_device()
breaks reference counting with all problems we may expect).

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is purely speculative.
> I've looked a bit arround and see no point for this get_device() but other
> eyes are welcomed :)
> ---
>  drivers/iio/accel/sca3000.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 66d768d971e1..6e429072e44a 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -980,7 +980,7 @@ static int sca3000_read_data(struct sca3000_state *st,
>         st->tx[0] = SCA3000_READ_REG(reg_address_high);
>         ret = spi_sync_transfer(st->us, xfer, ARRAY_SIZE(xfer));
>         if (ret) {
> -               dev_err(get_device(&st->us->dev), "problem reading register");
> +               dev_err(&st->us->dev, "problem reading register\n");
>                 return ret;
>         }
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
