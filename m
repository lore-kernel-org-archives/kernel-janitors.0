From: Dan Carpenter <error27@gmail.com>
Date: Thu, 13 Jan 2011 05:22:30 +0000
Subject: Re: [PATCH] Removes warning related to use of uninitialized
Message-Id: <20110113052230.GJ2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
In-Reply-To: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 12, 2011 at 06:26:43PM -0800, Sukanto Ghosh wrote:
> Diff against 2.6.37
> 

Please specify which version of gcc you are using in your change log.

> 
> Signed-off-by: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>
> 
> ----
> diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
> index b25e6e4..add97dd 100644
> --- a/drivers/serial/8250.c
> +++ b/drivers/serial/8250.c
> @@ -1724,7 +1724,7 @@ static int serial_link_irq_chain(struct
> uart_8250_port *up)
> 
>  static void serial_unlink_irq_chain(struct uart_8250_port *up)
>  {
> -       struct irq_info *i;
> +       struct irq_info *i = NULL;

Use the uninitialized_var() macro instead of initializing it to NULL.

>         struct hlist_node *n;
>         struct hlist_head *h;
> 
> @@ -1739,7 +1739,7 @@ static void serial_unlink_irq_chain(struct
> uart_8250_port *up)
>         }
> 
>         BUG_ON(n = NULL);
> -       BUG_ON(i->head = NULL);
> +       BUG_ON(i = NULL || i->head = NULL);

This change won't work with the uninitialized_var() macro and is not
needed anyway (your changelog says that we're only doing this to silence
a warning).

regards,
dan carpenter

> 
>         if (list_empty(i->head))
>                 free_irq(up->port.irq, i);

