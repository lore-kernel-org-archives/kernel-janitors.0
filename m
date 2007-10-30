From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 30 Oct 2007 08:40:12 +0000
Subject: Re: [patch] standardising boolean variables in drivers/net (first
Message-Id: <Pine.LNX.4.64.0710300436080.17231@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
In-Reply-To: <af42259d0710300134h63515753i6bcdad897a6296c3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  you should include the subsystem against which this patch applies in
the subject, as in:

  [PATCH] NET:  standardizing ...

and you should also CC that mailing list or maintainer of that
subsystem.

  also, if this is to be the first of many related patches, you might
consider doing a multi-part patch.

On Tue, 30 Oct 2007, Lucas Woods wrote:

> First patch here, be gentle, please let me know if I've made a mess of this :)
>
>
> Phase 1 standardised boolean variables in drivers/net
>
> --
> diff --git a/drivers/net/ipg.h b/drivers/net/ipg.h
> index d5d092c..f67b29b 100644
> --- a/drivers/net/ipg.h
> +++ b/drivers/net/ipg.h
> @@ -491,37 +491,37 @@ enum ipg_regs {
>   */
>
>  /* Miscellaneous Constants. */
> -#define   TRUE  1
> -#define   FALSE 0
> +#define   true  1
> +#define   false 0

  there should be no need to define the symbols "true" and "false" as
they should be predefined for variables of type "bool".

> @@ -7379,7 +7379,7 @@ s2io_init_nic(struct pci_dev *pdev, const struct
> pci_device_id *pre)
>  	struct s2io_nic *sp;
>  	struct net_device *dev;
>  	int i, j, ret;
> -	int dma_flag = FALSE;
> +	int dma_flag = false;

if a variable is truly going to represent just boolean values, you
might consider redeclaring it as "bool" instead of "int".

rday

--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
