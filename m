From: Julia Lawall <julia@diku.dk>
Date: Fri, 05 Mar 2010 07:49:56 +0000
Subject: Re: [patch linux-next] ipmi: remove voidp casts
Message-Id: <Pine.LNX.4.64.1003050849250.21768@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc8156581003042210p25fcd11v4616b42fbcf87699@mail.gmail.com>
In-Reply-To: <fc8156581003042210p25fcd11v4616b42fbcf87699@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 5 Mar 2010, Mahesh Kalappattil wrote:

> This trivial patch removes the (void *) conversion as per the kernel
> janitor TODO list.

Does that work if the original type is not a pointer type (unsigned long 
here)?

julia

> Signed-off-by: Mahesh Kalappattil <mahesh.lkml@gmail.com>
> 
> --- linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
> +++ linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2483,11 +2483,11 @@ static int __devexit ipmi_of_remove(stru
>  static struct of_device_id ipmi_match[] >  {
>         { .type = "ipmi", .compatible = "ipmi-kcs",
> -         .data = (void *)(unsigned long) SI_KCS },
> +         .data = (unsigned long) SI_KCS },
>         { .type = "ipmi", .compatible = "ipmi-smic",
> -         .data = (void *)(unsigned long) SI_SMIC },
> +         .data = (unsigned long) SI_SMIC },
>         { .type = "ipmi", .compatible = "ipmi-bt",
> -         .data = (void *)(unsigned long) SI_BT },
> +         .data = (unsigned long) SI_BT },
>         {},
>  };
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
