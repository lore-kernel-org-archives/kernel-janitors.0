From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Thu, 16 Jun 2016 09:23:25 +0000
Subject: Re: [PATCH 1/2 RESEND] staging: dgnc: remove redundant NULL checks in
Message-Id: <CAHb8M2CnYfqtRUAnx8C4TVUCtkYyQs7Fbr6wT1==kbTtqehjEw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160510064450.GA25522@certreview.com>
In-Reply-To: <20160510064450.GA25522@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Hounschell <markh@compro.net>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, devel <devel@driverdev.osuosl.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

2016-05-10 15:44 GMT+09:00 Daeseok Youn <daeseok.youn@gmail.com>:
> The dgnc_block_til_ready() is only used in dgnc_tty_open().
> The unit data(struct un_t) was stored into tty->driver_data in dgnc_tty_open().
> And also tty and un were tested about NULL so these variables doesn't
> need to check for NULL in dgnc_block_til_ready().
>
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
Hello Greg,

This patch and patches from this were not merged into your tree for a one month.
Can you tell me why these are still waiting to merge?

Thanks.
regards,
Daeseok.


> RESEND: more explanation about this patch.
> origin patch : https://lkml.org/lkml/2016/5/4/12
>
>  drivers/staging/dgnc/dgnc_tty.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
> index a505775..cff34d4 100644
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
> 2.8.2
>
