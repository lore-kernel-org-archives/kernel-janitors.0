From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 11 Apr 2020 22:53:51 +0000
Subject: Re: [PATCH] media: mantis: remove redundant assignment to variable err
Message-Id: <CAAEAJfCQaCCoShLPTA+EWUhMXdF6bKAxcOCj2SR5nPXMmk7LQg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410113913.14430-1-colin.king@canonical.com>
In-Reply-To: <20200410113913.14430-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Colin,

Thanks for your patch!

On Fri, 10 Apr 2020 at 08:39, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/pci/mantis/hopper_vp3028.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/mantis/hopper_vp3028.c b/drivers/media/pci/mantis/hopper_vp3028.c
> index 37bd386f3ed8..ce1e8737b14b 100644
> --- a/drivers/media/pci/mantis/hopper_vp3028.c
> +++ b/drivers/media/pci/mantis/hopper_vp3028.c
> @@ -33,7 +33,7 @@ static int vp3028_frontend_init(struct mantis_pci *mantis, struct dvb_frontend *
>  {
>         struct i2c_adapter *adapter     = &mantis->adapter;
>         struct mantis_hwconfig *config  = mantis->hwconfig;
> -       int err = 0;
> +       int err;
>
>         mantis_gpio_set_bits(mantis, config->reset, 0);
>         msleep(100);

There's a redundant err assignment right below here,
which you can also get rid of:

-       err = mantis_frontend_power(mantis, POWER_ON);
+       mantis_frontend_power(mantis, POWER_ON);

I can't test this, but calling mantis_frontend_power twice
is possibly redundant.

Also, what's the gain from this cleanup? The driver is super
old, and it seems any modern compiler would be oblivious
of the redundant assignment.

Thanks!
Ezequiel
