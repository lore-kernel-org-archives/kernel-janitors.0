From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Mon, 04 Jul 2016 11:44:38 +0000
Subject: Re: [PATCH 01/15 RESEND] staging: dgnc: remove redundant NULL checks in
Message-Id: <CAHb8M2DGBbYopfpy5++4ObozvQDUNfEmTmw5bC7cwGV_Ro4p3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160704113645.GA10177@SEL-JYOUN-D1>
In-Reply-To: <20160704113645.GA10177@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>
Cc: devel <devel@driverdev.osuosl.org>, Greg KH <gregkh@linuxfoundation.org>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-07-04 20:36 GMT+09:00 Daeseok Youn <daeseok.youn@gmail.com>:
> The dgnc_block_til_ready() is only used in dgnc_tty_open().
> The unit data(struct un_t) was stored into tty->driver_data in dgnc_tty_open().
> And also tty and un were tested about NULL so these variables doesn't
> need to check for NULL in dgnc_block_til_ready().
>
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
> This patch seems to be missed for a long time.
> I resend this patch without any updates.
>
>  drivers/staging/dgnc/dgnc_tty.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
> index 4eeecc9..6758859 100644
> --- a/drivers/staging/dgnc/dgnc_tty.c
> +++ b/drivers/staging/dgnc/dgnc_tty.c
> @@ -1172,17 +1172,12 @@ static int dgnc_block_til_ready(struct tty_struct *tty,
>                                 struct channel_t *ch)
>  {
>         int retval = 0;
> -       struct un_t *un = NULL;
> +       struct un_t *un = tty->driver_data;
>         unsigned long flags;
>         uint    old_flags = 0;
>         int     sleep_on_un_flags = 0;
>
> -       if (!tty || tty->magic != TTY_MAGIC || !file || !ch ||
> -           ch->magic != DGNC_CHANNEL_MAGIC)
> -               return -ENXIO;
> -
> -       un = tty->driver_data;
> -       if (!un || un->magic != DGNC_UNIT_MAGIC)
> +       if (!file)
>                 return -ENXIO;
>
>         spin_lock_irqsave(&ch->ch_lock, flags);
> --
> 1.9.1
>
This patch will be sent again, I made a mistake while gathering my
previous patches which didn't accepted for a long time.
Sorry for noise.

Thanks.

Regards,
Jake.
